//
//  ImageCache.swift
//  PlanetSwift
//
//  Created by Brad Bambara on 1/20/15.
//  Copyright (c) 2015 Small Planet. All rights reserved.
//

import UIKit
private let ImageCache_shared = ImageCache()

public typealias ImageCache_CompletionBlock = (UIImage? -> Void)
typealias ImageCache_DownloadBlock = ((success:Bool) -> Void)

public class ImageCache {
	
	//MARK: - public API
	
	public class var sharedInstance: ImageCache {
		return ImageCache_shared
	}
	
	public func get(url:NSURL, completion:ImageCache_CompletionBlock) {
        #if swift(>=2.3)
            let imageKey = url.absoluteString!
        #else
            let imageKey = url.absoluteString
        #endif
			
        if let memCacheImage = memoryCache.objectForKey(imageKey) as? UIImage {
            completion(memCacheImage)
            return
        }
            
        if url.isFileReferenceURL() {
            if let image = UIImage(contentsOfFile: imageKey) {
                
                memoryCache.setObject(image, forKey: imageKey)
                completion(image)
                
                return
            }
        }
        
        var cacheRequest:ImageCacheRequest!
        if let activeRequest = activeRequestForKey(imageKey) {
            cacheRequest = activeRequest
        }
        else {
            cacheRequest = ImageCacheRequest(url: url, completion: { [weak self] (success:Bool) in
                
                if self != nil {
                    var image:UIImage? = nil
                    if success {
                        image = UIImage(data: cacheRequest.imageData)
                        if image != nil {
                            self!.memoryCache.setObject(image!, forKey: imageKey)
                        }
                    }
                    
                    var index = 0
                    for request in self!.activeNetworkRequests {
                        
                        if request === cacheRequest {
                            break
                        }
                        index += 1
                    }
                    self!.activeNetworkRequests.removeAtIndex(index)
                    
                    //call all completion blocks
                    for block in cacheRequest.completionBlocks {
                        block(image)
                    }
                }
            })
            activeNetworkRequests.append(cacheRequest)
        }
        
        //append our completion block to this already-in-progress request
        cacheRequest.completionBlocks.append(completion)
	}
	
	public func get(key:AnyObject) -> UIImage? {
		return memoryCache.objectForKey(key) as? UIImage
	}
	
	public func set(image:UIImage, key:AnyObject) {
		memoryCache.setObject(image, forKey: key)
	}
	
	//MARK: - private
	
	private let memoryCache = NSCache()
	private var activeNetworkRequests = Array<ImageCacheRequest>()
	
	private func activeRequestForKey(key:String) -> ImageCacheRequest? {
		for request in activeNetworkRequests {
			if request.request.URL!.absoluteString == key {
				return request
			}
		}
		return nil
	}
}

internal class ImageCacheRequest : NSObject, NSURLConnectionDelegate, NSURLConnectionDataDelegate {
	
	var completionBlocks = Array<ImageCache_CompletionBlock>()
	let request:NSURLRequest
	var connection:NSURLConnection?
	let completionBlock:ImageCache_DownloadBlock
	let imageData:NSMutableData
	
	init(url:NSURL, completion:ImageCache_DownloadBlock) {
		
		completionBlock = completion
		request = NSURLRequest(URL: url, cachePolicy: .ReturnCacheDataElseLoad, timeoutInterval: 60)
		imageData = NSMutableData()
		connection = NSURLConnection()
        
		super.init()
		
		connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        connection?.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
        connection?.start()
		if connection == nil {
			completionBlock(success: false)
		}
	}
	
	//MARK: - NSURLConnectionDelegate
	
	func connection(connection: NSURLConnection, didFailWithError error: NSError) {
		completionBlock(success: false)
	}
	
	//MARK: - NSURLConnectionDataDelegate
	
	func connection(connection: NSURLConnection, didReceiveData data: NSData) {
		imageData.appendData(data)
	}
	
	func connectionDidFinishLoading(connection: NSURLConnection) {
		completionBlock(success: true)
	}
	
}

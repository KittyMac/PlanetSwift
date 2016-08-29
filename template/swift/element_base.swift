<%
FULL_NAME_CAPS = "_"..string.upper(this.namespace).."_"..string.upper(this.name).."BASE".."_";
CAP_NAME = capitalizedString(this.name);
FULL_NAME_CAMEL = capitalizedString(this.namespace).."_"..capitalizedString(this.name).."Base";
SUPERCLASS_OVERRIDE = ""; if (hasSuperclass(this)) then SUPERCLASS_OVERRIDE="override "; end
%>//
// Autogenerated by gaxb at <%= os.date("%I:%M:%S %p on %x") %>
//

import UIKit

public class <%= CAP_NAME %>Base<% if (hasSuperclass(this)) then %> : <%= superclassForItem(this) %><% else %> : GaxbElement<% end %> {
<% if (hasSuperclass(this) == false) then %>
    public var xmlns: String = "<%= this.namespaceURL %>"
    public weak var parent: GaxbElement?
    public var originalValues = Dictionary<String, String> ()

    public required init() { }
    public func gaxbPrepare() { }
    public func gaxbDidPrepare() { }

<% end
local sequencesCount = 0;
local hasAnys = false;
for k,v in pairs(this.sequences) do
  sequencesCount = sequencesCount + 1;
  if (v.name == "any") then
    gaxb_print("\tpublic var anys: Array<GaxbElement> = []\n");
    hasAnys = true;
	elseif (isPlural(v)) then
  %>    public var <%= lowercasedString(pluralName(v.name)) %>: Array<<%= simpleTypeForItem(v) %>> = []
<%
  else
  %>    public var <%= lowercasedString(v.name) %>: <%= simpleTypeForItem(v) %>?
<%
	end
end

%>

    public <%= SUPERCLASS_OVERRIDE %>func copy() -> GaxbElement {
<%if hasSuperclass(this) then %>        let copied = super.copy() as! <%= CAP_NAME %>
<% else %>        let copied = type(of: self).init()
<% end %>
<%for k,v in pairs(this.sequences) do
			if (v.name == "any") then
		 		%>        var anyCopy: GaxbElement
        for any in anys {
            anyCopy = any.copy()
            copied.anys.append(anyCopy)
            anyCopy.parent = copied
        }
<%		elseif (isPlural(v)) then
				%>        for child in <%= lowercasedString(pluralName(v.name)) %> {
            let childCopy = child.copy() as! <%= simpleTypeForItem(v) %>
            copied.<%= lowercasedString(pluralName(v.name)) %>.append(childCopy)
            childCopy.parent = copied
        }
<%
			else
		 		%><%= copied.lowercasedString(v.name) %> = lowercasedString(v.name) %>.copy() as! <%= simpleTypeForItem(v) %>
<%		end
	end
    for k,v in pairs(this.attributes) do
%>        copied.<%= v.name %> = <%= v.name %>
<%    end
%>
        return copied
    }

	public <%= SUPERCLASS_OVERRIDE %>func visit(_ visitor: (GaxbElement) -> ()) {
<%if hasSuperclass(this) then %>        super.visit(visitor)
<% else %>        visitor(self)
<% end %>
<%for k,v in pairs(this.sequences) do
			if (v.name == "any") then
		 		%>        for any in anys {
            any.visit(visitor)
        }
<%		elseif (isPlural(v)) then
				%>        for child in <%= lowercasedString(pluralName(v.name)) %> { child.visit(visitor) }
<%
			else
		 		%><%= lowercasedString(v.name) %>.visit(visitor)
<%		end
		end %>	}

<%

%>    <%= SUPERCLASS_OVERRIDE %>public func setElement(_ element: GaxbElement, key:String) {<%
    if (sequencesCount > 0) then
      for k,v in pairs(this.sequences) do
        if (v.name ~= "any") then %>
        if let e = element as? <%= capitalizedString(v.name) %> {
<% if (isPlural(v)) then %>           <%= lowercasedString(pluralName(v.name)) %>.append(e)
           e.setParent(self)
<% else %>           <%= lowercasedString(v.name) %> = e
           e.setParent(self)
<% end %>           return
        }<%
    end
  end
  end
    if (hasAnys) then %>
        anys.append(element)
        element.setParent(self)
<% end if (not hasAnys and hasSuperclass(this)) then %>
        super.setElement(element, key:key)
<%  end %>    }
<% if (hasSuperclass(this) == false) then  %>
    public func setParent(_ parent: GaxbElement) {
        self.parent = parent
    }
<% end %>
    <%= SUPERCLASS_OVERRIDE %> public func isKindOfClass(_ className: String) -> Bool {
        if className == "<%= CAP_NAME %>" {
            return true
        }
<% if (hasSuperclass(this)) then
%>        return super.isKindOfClass(className)
<% else
%>        return false
<% end
%>    }
<%
  local hasAttributes = false
  for k,v in pairs(this.attributes) do
    hasAttributes = true %>
	public var <%= v.name %>: <%if (isEnumForItem(v)) then %><%= capitalizedString(this.namespace) %>.<% end %><%= typeForItem(v) %><%
	if (v.default == nil) then %>?<% else %> = <%if (isEnumForItem(v)) then %>.<% end %><% if (typeNameForItem(v)=="String") then %>"<% end %><%= v.default %><% if (typeNameForItem(v)=="String") then %>"<% end %><%
	end %>

    func <%= v.name %>AsString() -> String {<%
 if (v.type=="string") then %>
        return <%= v.name %><% if (v.default == nil) then %> ?? ""<% end %>
<% elseif (isEnumForItem(v)) then %>
        return <%= v.name %><% if (v.default == nil) then %>!<% end %>.rawValue
<% elseif (isGaxbTypeForItem(v)) then %>
        return <%= v.name %><% if (v.default == nil) then %>!<% end %>.toGaxbString()
<% else %>
        return <%= v.name %><% if (v.default == nil) then %>!<% end %>.toGaxbString()
<% end
%>    }

    public func set<%= capitalizedString(v.name) %>(_ value: String) {
<%	if (typeNameForItem(v)=="Bool") then
%>        self.<%= v.name %> = value == "true"<%
    elseif (typeNameForItem(v)=="Int") then
%>        self.<%= v.name %> = Int(value)!<%
elseif (typeNameForItem(v)=="Float") then
%>        self.<%= v.name %> = (value as NSString).floatValue<%
elseif (typeNameForItem(v)=="Double") then
%>        self.<%= v.name %> = (value as NSString).doubleValue<%
elseif (typeNameForItem(v)=="String") then
%>        self.<%= v.name %> = value<%
elseif (isEnumForItem(v)) then
%>        if let tmp = <%= capitalizedString(this.namespace) %>.<%= typeForItem(v) %>(rawValue: value) {
            <%= v.name %> = tmp
        }<%
elseif (isGaxbTypeForItem(v)) then
%>        <%= v.name %> =  <%= typeForItem(v) %>(gaxbString: value)<%
end %>
    }
<%
	end %>
    <%= SUPERCLASS_OVERRIDE %>public func setAttribute(_ value: String, key:String) {
<% if (hasSuperclass(this)) then %>        super.setAttribute(value, key:key)
<% else %>        originalValues[key] = value
<% end %>        switch key {
<% for k,v in pairs(this.attributes) do
%>            case "<%= v.name %>":
                set<%= capitalizedString(v.name) %>(value)
<%    end
%>            default:
                break
        }
    }

    <%= SUPERCLASS_OVERRIDE %>public func imprintAttributes(_ receiver: GaxbElement?) -> GaxbElement? {
<% if (hasAttributes == true) then
%>       if let obj = receiver as? <%= CAP_NAME %> {
<% for k,v in pairs(this.attributes) do
%>            if <%if (v.default == nil) then %><%= v.name %> != nil && <% end %>obj.originalValues["<%= v.name %>"] == nil {
                obj.<%= v.name %> = <%= v.name %>
            }
<% end
%>       }
<% end %>       return <% if (hasSuperclass(this)) then %>super.imprintAttributes(receiver)<% else %>receiver<% end %>
    }
<%
-- MixedContent is a big todo
	if (this.mixedContent) then %>
@synthesize MixedContent;
-(void) setMixedContent:(NSString *)v
{
    if([v isKindOfClass:[NSString class]] == NO)
    {
        v = [v description];
    }
    MixedContent = v;
};
- (NSString *) MixedContentAsString { return [MixedContent description]; }
- (void) setMixedContentWithString:(NSString *)string
{
	[self setMixedContent:[[NSClassFromString(@"NSString") alloc] initWithString:string]];
}
<%
	end
%>
    <%= SUPERCLASS_OVERRIDE %>public func attributesXML(_ useOriginalValues:Bool) -> String {
        var xml = ""
        if useOriginalValues {
            for (key, value) in originalValues {
                xml += " \\(key)='\\(value)'"
            }
        } else {
<% for k,v in pairs(this.attributes) do
%><% if (v.default == nil) then %>            if <%= v.name %> != nil {
    <% end %>            xml += " <%= v.name %>='\\(<%= v.name %>AsString())'"
<% if (v.default == nil) then %>            }
    <% end
end
%>        }
<% if (hasSuperclass(this)) then
%>        xml += super.attributesXML(useOriginalValues)
<% end %>
        return xml
    }

    <%= SUPERCLASS_OVERRIDE %>public func sequencesXML(_ useOriginalValues:Bool) -> String {
        var xml = ""<%
    for k,v in pairs(this.sequences) do
      if (isPlural(v)) then %>
        for <%= lowercasedString(v.name) %> in <%= lowercasedString(pluralName(v.name)) %> {
            xml += <%= lowercasedString(v.name) %>.toXML()
        }<% else %>    xml += <%= lowercasedString(v.name) %>.toXML()<% end
    end
 if (hasSuperclass(this)) then %>
        xml += super.sequencesXML(useOriginalValues)
<% end %>
        return xml
    }

    <%= SUPERCLASS_OVERRIDE %>public func toXML(_ useOriginalValues:Bool) -> String {
        var xml = "<<%= CAP_NAME %>"
        if (parent == nil || parent?.xmlns != xmlns) {
            xml += " xmlns='\\(xmlns)'"
        }

        xml += attributesXML(useOriginalValues)

        let sXML = sequencesXML(useOriginalValues)
        xml += sXML == "" ? "/>" : ">\\(sXML)</<%= CAP_NAME %>>"
        return xml
    }

    <%= SUPERCLASS_OVERRIDE %>public func toXML() -> String {
        return toXML(false)
    }

    <%= SUPERCLASS_OVERRIDE %>public func description() -> String {
        return toXML()
    }

}

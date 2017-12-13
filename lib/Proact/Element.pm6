unit class Proact::Element;

has $.tag-name      is required;
has @.children;
has %.pars;

method new(:$tag-name, *%pars) {
	if not self.is-valid-tag: $tag-name {
		fail "Tag '$tag-name' isn't a valid tag name";
	}
	self.bless: :$tag-name, |%pars
}

proto method value(                 $ ) { *                         }
#multi method value(Component        $_) { self.value(.render, $_)   }
multi method value(Proact::Element  $_) { .render                   }
multi method value(Positional       $_) { |.map: {self.value($_)}   }
multi method value(Any:U            $_) { Empty                     }
multi method value(Block            $_) { .name                     }
multi method value($ where * === False) { False                     }
multi method value($ where * === True ) { True                      }
multi method value(Any              $_) { .Str                      }

proto method translate-key(         $ ) { *         }
multi method translate-key("className") { "class"   }
multi method translate-key(Any      $_) { $_        }

proto method attr($name, $value) 					{*}
multi method attr($name, $value where * === False)	{
	""
}
multi method attr($name, $value where * === True )	{
	"{self.translate-key($name)}"
}
multi method attr($name, $value) 					{
	"{self.translate-key($name)}='{$value}'"
}
method !attrs is hidden-from-backtrace {
	%!pars.kv.map(-> $name, $value {
		self.attr: $name, $value
	})
	.join: " "
}

my @valid-tags =
  "a"			, "abbr"		, "acronym"		, "address"	, "applet",
  "area"		, "article"		, "aside"		, "audio"	, "b",
  "base"		, "basefont"	, "bdi"			, "bdo"		, "bgsound",
  "big"			, "blink"		, "blockquote"	, "body"	, "br",
  "button"		, "canvas"		, "caption"		, "center"	, "cite",
  "code"		, "col"			, "colgroup"	, "command"	, "content",
  "data"		, "datalist"	, "dd"			, "del"		, "details",
  "dfn"			, "dialog"		, "dir"			, "div"		, "dl",
  "dt"			, "element"		, "em"			, "embed"	, "fieldset",
  "figcaption"	, "figure"		, "font"		, "footer"	, "form",
  "frame"		, "frameset"	, "h1"			, "h2"		, "h3",
  "h4"			, "h5"			, "h6"			, "head"	, "header",
  "hgroup"		, "hr"			, "html"		, "i"		, "iframe",
  "image"		, "img"			, "input"		, "ins"		, "isindex",
  "kbd"			, "keygen"		, "label"		, "legend"	, "li",
  "link"		, "listing"		, "main"		, "map"		, "mark",
  "marquee"		, "math"		, "menu"		, "menuitem", "meta",
  "meter"		, "multicol"	, "nav"			, "nextid"	, "nobr",
  "noembed"		, "noframes"	, "noscript"	, "object"	, "ol",
  "optgroup"	, "option"		, "output"		, "p"		, "param",
  "picture"		, "plaintext"	, "pre"			, "progress", "q",
  "rb"			, "rbc"			, "rp"			, "rt"		, "rtc",
  "ruby"		, "s"			, "samp"		, "script"	, "section",
  "select"		, "shadow"		, "slot"		, "small"	, "source",
  "spacer"		, "span"		, "strike"		, "strong"	, "style",
  "sub"			, "summary"		, "sup"			, "svg"		, "table",
  "tbody"		, "td"			, "template"	, "textarea", "tfoot",
  "th"			, "thead"		, "time"		, "title"	, "tr",
  "track"		, "tt"			, "u"			, "ul"		, "var",
  "video"		, "wbr"			, "xmp"
;
proto method is-valid-tag($                      ) { *     }
multi method is-valid-tag($ where any @valid-tags) { True  }
multi method is-valid-tag($                      ) { False }

method render {
	if @!children.elems > 0 {
		qq:to/END/;
		<{$!tag-name}{(" " if %!pars > 0) ~ self!attrs}>
		{
			@!children
			.map({
				self.value($_)
			})
			.join("\n")
			.indent: 5
		}
		</$!tag-name>
		END
	} else {
		qq|<{$!tag-name}{(" " if %!pars > 0) ~ self!attrs} />|
	}
}

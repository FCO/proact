use Test;
use Proact::Element;

throws-like {Proact::Element.new: :tag-name<bla>}, Exception, message => /bla/;

like	Proact::Element.new(:tag-name<div>).render,
		rule {^  "<" ~ "/>" "div" $}
;
like	Proact::Element.new(:tag-name<div>, :children[1]).render,
		rule {^ ["<" ~ ">" "div"] 1 ["</" ~ ">" "div"] $}
;
like	Proact::Element.new(:tag-name<div>, :pars{:1a, :2b, :3c}).render,
		rule {^ "<" ~ "/>" ["div" ["a='1'" | "b='2'" | "c='3'"] ** 3] $}
;
like	Proact::Element.new(:tag-name<div>, :pars{:1a, :2b, :3c}, :children[1]).render,
		rule {^ ["<" ~ ">" ["div" ["a='1'" | "b='2'" | "c='3'"] ** 3]] ~ ["</" ~ ">" "div"] 1 $}
;

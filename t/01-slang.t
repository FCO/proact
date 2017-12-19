use Test;
use Proact::Slang;
use Proact::Element;


eval-lives-ok Q{<a b>};

is-deeply p6x <div />, Proact::Element.new: :tag-name<div>;
is-deeply p6x <div a=A1 b=B2 c=C3 />, Proact::Element.new: :tag-name<div>, :pars{:a<A1>, :b<B2>, :c<C3>};
is-deeply p6x <div a="A 1" b="B 2" c="C 3" />, Proact::Element.new: :tag-name<div>, :pars{:a("A 1"), :b("B 2"), :c("C 3")};
is-deeply p6x <div a={{"A"~"1"}} b={{"B"~"2"}} c={{"C"~"3"}} />, Proact::Element.new: :tag-name<div>, :pars{:a("A1"), :b("B2"), :c("C3")};

is-deeply p6x <div></div>, Proact::Element.new: :tag-name<div>;
is-deeply p6x <div a=A1 b=B2 c=C3></div>, Proact::Element.new: :tag-name<div>, :pars{:a<A1>, :b<B2>, :c<C3>};
is-deeply p6x <div a="A 1" b="B 2" c="C 3"></div>, Proact::Element.new: :tag-name<div>, :pars{:a("A 1"), :b("B 2"), :c("C 3")};
is-deeply p6x <div a={{"A"~"1"}} b={{"B"~"2"}} c={{"C"~"3"}}></div>, Proact::Element.new: :tag-name<div>, :pars{:a("A1"), :b("B2"), :c("C3")};

is-deeply p6x <div>123</div>, Proact::Element.new: :tag-name<div>, :children["123"];
is-deeply p6x <div><h1 /></div>, Proact::Element.new: :tag-name<div>, :children[Proact::Element.new: :tag-name<h1>];
is-deeply p6x <div>1<h1 />2</div>, Proact::Element.new: :tag-name<div>, :children["1", Proact::Element.new(:tag-name<h1>), "2"];
is-deeply p6x <div>{{1}}<h1 />{{2}}</div>, Proact::Element.new: :tag-name<div>, :children[1, Proact::Element.new(:tag-name<h1>), 2];

is-deeply p6x <div>{{p6x <p>42</p>}}</div>, Proact::Element.new: :tag-name<div>, :children[Proact::Element.new: :tag-name<p>, :children["42"]];

done-testing;

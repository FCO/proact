use Test;

use lib "t/lib";
use ElementTest;

use Proact;
use Proact::ElementPlugin;

role Bla does Proact::ElementPlugin {}

isa-ok &element-plugins, Sub;

element-plugins(Bla);

does-ok Proact::Element.new(:tag-name<div>), Bla;

does-ok div-element, Bla;

done-testing;

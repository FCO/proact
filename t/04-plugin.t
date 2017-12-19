use Test;

use lib "t/lib";
use ElementTest;
use Proact;

component C {
    method render {}
}

use Proact::ElementPlugin;
use Proact::ComponentPlugin;

role Bla does Proact::ElementPlugin {}
role Ble does Proact::ComponentPlugin {}

subtest {
    isa-ok &element-plugins, Sub;

    element-plugins Bla;

    is-deeply @Proact::element-plugins, [Bla];
    does-ok Proact::Element.new(:tag-name<div>), Bla;
    does-ok div-element, Bla;
}

todo "Make component without render method crash on compile time";
subtest {
    isa-ok &component-plugins, Sub;

    component-plugins Ble;

    is-deeply component-plugins, (Ble,);
    does-ok C.new, Ble;
    does-ok div-component, Ble;
}

done-testing;

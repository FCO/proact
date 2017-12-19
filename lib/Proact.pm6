use MetamodelX::ComponentHOW;
use Proact::ElementPlugin;

package Proact {
    our @element-plugins;

    sub EXPORT {
        use Proact::Element;
        use Proact::Component;
        use Proact::ElementPlugin;
        use Proact::ComponentPlugin;
        %(
            "Element"               => Proact::Element,
            "Component"             => Proact::Component,
            "&element-plugins"      => &element-plugins,
            "&component-plugins"    => &component-plugins,
        )
    }

}

my package EXPORTHOW {
    package DECLARE {
        constant component = MetamodelX::ComponentHOW;
    }
}

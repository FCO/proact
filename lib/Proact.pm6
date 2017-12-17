use MetamodelX::ComponentHOW;
use Proact::ElementPlugin;

package Proact {
    our @element-plugins;

    sub EXPORT {
        use Proact::Element;
        use Proact::ElementPlugin;
        %(
            "Element"           => Proact::Element,
            "&element-plugins"  => &element-plugins,
        )
    }

}

my package EXPORTHOW {
    package DECLARE {
        constant component = MetamodelX::ComponentHOW;
    }
}

use Proact::Element;
use MetamodelX::ComponentHOW;
unit package Proact;
our @element-plugins;

sub element-plugins(*@plugins) is export {
    @element-plugins.push: $_ for @plugins
}

sub EXPORT {
    %(
        "Element"               => Proact::Element,
        "component"             => MetamodelX::ComponentHOW,
    )
}

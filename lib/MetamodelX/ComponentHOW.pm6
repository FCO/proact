use Proact::Component;
use X::Proact::Component::WithOutRenderMethod;
class MetamodelX::ComponentHOW is Metamodel::ClassHOW {
    method new_type(|) {
        my \type = callsame;
        type.^add_parent: Proact::Component;
        type
    }
    #method compose($class, |) {
    #    nextsame;
    #    X::Proact::Component::WithOutRenderMethod.new(:class-name($class.^name)).throw unless $class.^lookup("render");
    #}
}

use Proact::Component;
class MetamodelX::ComponentHOW is Metamodel::ClassHOW {
    method new_type(|) {
        my \type = callsame;
        type.^add_parent: Proact::Component;
        #ComponentStore.components{type.^name} = type;
        type
    }
}

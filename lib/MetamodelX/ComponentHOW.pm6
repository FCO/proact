class MetamodelX::ComponentHOW is Metamodel::ClassHOW {
    method new_type(|) {
        my \type = callsame;
        type.^add_role: Component;
        ComponentStore.components{type.^name} = type;
        type
    }
}

use Proact;

sub div-element is export {
    Proact::Element.new: :tag-name<div>
}

component C1 {
    method render {
        div-element
    }
}

sub div-component is export {
    C1.new
}

$(document).ready(function () {
    autoCheckAllBox();
    autoCheckBoxParent();
});

function autoCheckAllBox() {
    $('.checkAll').change(function () {
        if(this.checked){
            $(this).closest('table').find('tbody input[type=checkbox]').prop('checked',true);
        }
    });
}
function autoCheckBoxParent() {
    var totalCheckBoxChild=$('.checkAll').closest('table').find('tbody input[type=checkbox]').length;
    $('.checkAll').closest('table').find('tbody input[type=checkbox]').each(function () {
        $(this).on('change',function () {
            var totalCheckBoxChecked=$('.checkAll').closest('table').find('tbody input[type=checkbox]:checked').length;
            if(totalCheckBoxChild==totalCheckBoxChecked){
                $('.checkAll').prop('checked',true);
            } else{
                $('.checkAll').prop('checked',false);
            }
        });
    });
}
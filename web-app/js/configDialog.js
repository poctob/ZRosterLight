/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function() {
  setupEditDialog(true,"#config-dialog-form");
  setupEditDialog(true,"#privilege-dialog-form");
});

function setupEditDialog(isedit, dialog_id) {
    var btn_text;
    var  dialog_form_id=dialog_id+'-remote';
    if (isedit)
    {
        btn_text = "Update";
    }
    else
    {
        btn_text = "Create";
    }

    var d_buttons = {};
    
    d_buttons[btn_text] = function() {
        $(dialog_form_id).submit();
        $(this).dialog("close");
    };
    d_buttons['Cancel'] = function() {
        $(this).dialog("close");
    };
        

    $(dialog_id).dialog({
        autoOpen: false,
        height: 300,
        width: 350,
        modal: true,
        buttons: d_buttons
    });                  
}


 function showDialog(isedit, dialog_id)
  {
        setupEditDialog(isedit, dialog_id);
        $(dialog_id).dialog('open');        
 }



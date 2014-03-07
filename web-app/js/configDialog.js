/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function() {
  setupEditDialog(true);
});

function setupEditDialog(isedit) {
    var btn_text;
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
        $("#config-dialog-form-remote").submit();
        $(this).dialog("close");
    };
    d_buttons['Cancel'] = function() {
        $(this).dialog("close");
    };
        

    $("#config-dialog-form").dialog({
        autoOpen: false,
        height: 300,
        width: 350,
        modal: true,
        buttons: d_buttons
    });        
}

 function showDialog(isedit)
  {
        setupEditDialog(isedit);
        $('#config-dialog-form').dialog('open');
 }


//makes an editor, sets the theme and mode, defaults wordwrap (because, not having that sucks always.)
//locks read only, for after the answer is there
//MAKE AN EDITOR
var editor = ace.edit("editor");
editor.setTheme("ace/theme/tomorrow_night_blue");
editor.getSession().setMode("ace/mode/javascript");
editor.getSession().setUseWrapMode(true);
editor.setValue("Sign Up To Use This")
editor.setReadOnly(true);
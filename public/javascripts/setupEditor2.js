var editor = ace.edit("editor");
editor.setTheme("ace/theme/tomorrow_night_blue");
editor.getSession().setMode("ace/mode/javascript");
editor.getSession().setUseWrapMode(true);
editor.setValue("Sign Up To Use This")
editor.setReadOnly(true);
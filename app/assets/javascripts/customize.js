if(document.getElementById("test_code")){
  var editor = CodeMirror.fromTextArea(document.getElementById("test_code"), {
  mode: "text/x-ruby",
  matchBrackets: true,
  indentUnit: 4
});
}

if(document.getElementById("solution_code")){
  var editor = CodeMirror.fromTextArea(document.getElementById("solution_code"), {
  mode: "text/x-ruby",
  matchBrackets: true,
  indentUnit: 4
});
}

if(document.getElementById("display_solution_code")){
  var editor = CodeMirror.fromTextArea(document.getElementById("display_solution_code"), {
  mode: "text/x-ruby",
  matchBrackets: true,
  indentUnit: 4,
  readOnly: true
});
}

if(document.getElementById("display_test_code")){
  var editor = CodeMirror.fromTextArea(document.getElementById("display_test_code"), {
  mode: "text/x-ruby",
  matchBrackets: true,
  indentUnit: 4,
  readOnly: true
});
}

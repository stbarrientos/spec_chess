var editor = CodeMirror.fromTextArea(document.getElementById("test_code"), {
  mode: "text/x-ruby",
  matchBrackets: true,
  indentUnit: 4
});

var editor = CodeMirror.fromTextArea(document.getElementById("solution_code"), {
  mode: "text/x-ruby",
  matchBrackets: true,
  indentUnit: 4
});
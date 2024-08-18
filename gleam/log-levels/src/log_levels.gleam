import gleam/string

pub fn message(log_line: String) -> String {
  case string.split_once(log_line, ":") {
    Ok(#(_, message_content)) -> string.trim(message_content)
    Error(_) -> ""
  }
}

pub fn log_level(log_line: String) -> String {
  case string.split_once(log_line, "]") {
    Ok(#(type_content, _)) ->
      type_content |> string.drop_left(1) |> string.lowercase()
    Error(_) -> ""
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}

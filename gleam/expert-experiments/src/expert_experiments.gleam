import gleam/result

pub fn with_retry(experiment: fn() -> Result(t, e)) -> Result(t, e) {
  // result.try_recover(experiment(), fn(_err) { experiment() })
  use _ <- result.try_recover(experiment())
  experiment()
}

pub fn record_timing(
  time_logger: fn() -> Nil,
  experiment: fn() -> Result(t, e),
) -> Result(t, e) {
  time_logger()
  let result = experiment()
  time_logger()
  result
}

pub fn run_experiment(
  name: String,
  setup: fn() -> Result(t, e),
  action: fn(t) -> Result(u, e),
  record: fn(t, u) -> Result(v, e),
) -> Result(#(String, v), e) {
  use setup_ok <- result.try(setup())
  use action_ok <- result.try(action(setup_ok))
  use recording_result_ok <- result.try(record(setup_ok, action_ok))

  Ok(#(name, recording_result_ok))
}

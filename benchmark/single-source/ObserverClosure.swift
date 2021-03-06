
class Observer {
  @inline(never)
  func receive(_ value: Int) {
  }
}

class Signal {
  var observers: [(Int) -> ()] = []

  func subscribe(_ observer: @escaping (Int) -> ()) {
    observers.append(observer)
  }

  func send(_ value: Int) {
    for observer in observers {
      observer(value)
    }
  }
}

public func run_ObserverClosure(_ iterations: Int) {
  let signal = Signal()
  let observer = Observer()
  for _ in 0 ..< 10_000 * iterations {
    signal.subscribe { i in observer.receive(i) }
  }
  signal.send(1)
}

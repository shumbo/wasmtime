;;! stack_switching = true

;; Basic test for stack switching: create and resume a continuation.

(module
  (type $ft (func))
  (type $ct (cont $ft))

  (func $noop)

  (func (export "resume-noop")
    (resume $ct (cont.new $ct (ref.func $noop)))
  )
)

(invoke "resume-noop")

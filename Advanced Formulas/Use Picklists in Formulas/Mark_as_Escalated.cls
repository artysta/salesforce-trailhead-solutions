AND(
    IsEscalated,
    OR(
        IsClosed,
        IsClosedOnCreate,
        !ISPICKVAL(Priority, "High")
    )
)
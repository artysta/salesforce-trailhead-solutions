IF(
    (TODAY() - DATEVALUE(CreatedDate)) / (CloseDate - DATEVALUE(CreatedDate)) <= 0.25, "Early",
    IF(AND(
        (TODAY() - DATEVALUE(CreatedDate)) / (CloseDate - DATEVALUE(CreatedDate)) > 0.25,
        (TODAY() - DATEVALUE(CreatedDate)) / (CloseDate - DATEVALUE(CreatedDate)) < 0.75), "Middle",
        IF((TODAY() - DATEVALUE(CreatedDate)) / (CloseDate - DATEVALUE(CreatedDate)) > 0.75, "Late", NULL)
    )
)
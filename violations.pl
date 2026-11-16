
violation('А123БВ77', превышение_скорости, '2026-05-10 14:30', 500, неоплчено).
violation('А123БВ77', проезд_на_красный, '2026-05-12 09:15', 1000, оплачено).
violation('К777ММ99', парковка_в_неположенном_месте, '2026-05-11 18:00', 1500, неоплчено).
violation('О456РТ78', превышение_скорости, '2026-05-10 16:00', 500, оплачено).

violation_by_time(StartTime, EndTime, Car, Type, Time) :-
    violation(Car, Type, Time, _, _),
    Time @>= StartTime,
    Time @=< EndTime.

has_unpaid_fines(Car) :-
    violation(Car, _, _, _, неоплчено).
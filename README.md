```
DDATE.SH(1)                 General Commands Manual                DDATE.SH(1)

NAME
       ddate.sh - a ddate-equivalent to date(1)

SYNOPSIS
       ddate.sh [FORMAT]

DESCRIPTION
       ddate.sh todays date in discordian time

FORMAT
       %%     a literal %

       %a     locale's abbreviated weekday name (e.g., SM)

       %A     locale's full weekday name (e.g., Sweetmorn)

       %b     locale's abbreviated season name (e.g., Chs)

       %B     locale's full season name (e.g., Chaos)

       %C     century; like %Y, except omit last two digits (e.g., 20)

       %d     day of season (e.g, 01)

       %u     day of week (1..5); 1 is Sweetmorn

       %m     season (0..5)

       %y     last two digits of year (00..99)

       %Y     year

SEE ALSO
       date(1)

EXAMPLES
       $ ddate.sh +%d.%m.%Y
       34.2.3182

       $ ddate.sh "%A, %B %d, YOLD %Y"
       Setting Orange, Confusion 34, YOLD 3182

                                                                   DDATE.SH(1)
```

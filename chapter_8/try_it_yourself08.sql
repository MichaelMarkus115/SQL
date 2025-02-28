SELECT
    pls14.stabr,
    sum(pls14.visits) AS visits_2014,
    sum(pls09.visits) AS visits_2009,
    round(
        (
            CAST(sum(pls14.visits) AS decimal(10, 1)) - sum(pls09.visits)
        ) / sum(pls09.visits) * 100,
        2
    ) AS pct_change
FROM
    pls_fy2014_pupld14a pls14
    JOIN pls_fy2009_pupld09a pls09 ON pls14.fscskey = pls09.fscskey
WHERE
    pls14.visits >= 0
    AND pls09.visits >= 0
GROUP BY
    pls14.stabr
ORDER BY
    pct_change DESC;
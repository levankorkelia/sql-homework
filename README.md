# SQL საშინაო დავალება

MySQL 8 — ყველა დავალება (1–12) და Final Challenge ერთ ფაილშია:
[`sql_homework.sql`](sql_homework.sql)

## როგორ გავუშვა

სკრიპტი თავიდან ბოლომდე ერთიანად ეშვება: ქმნის `sql_homework` ბაზას,
ცხრილებს, ავსებს მონაცემებს და შემდეგ ასრულებს ყველა query-ს.

```bash
mysql -u root < sql_homework.sql
```

ან MySQL Workbench-ში: File → Open SQL Script → ⚡ (Execute).

## შინაარსი

| # | თემა |
|---|------|
| 1 | `SELECT`, `WHERE`, `LIKE`, `IN`, `BETWEEN` |
| 2 | `INSERT`, `UPDATE`, `DELETE` |
| 3 | `COUNT`, `AVG`, `MIN`, `MAX`, `SUM` |
| 4 | `GROUP BY` |
| 5 | `HAVING`, `WHERE + GROUP BY + HAVING` |
| 6 | `INNER`, `LEFT`, `RIGHT JOIN` |
| 7 | `FULL OUTER JOIN`-ის იმიტაცია (`LEFT JOIN UNION RIGHT JOIN`) |
| 8 | Subquery |
| 9 | `EXISTS`, `NOT EXISTS` |
| 10 | `ANY`, `SOME`, `ALL` |
| 11 | `UNION`, `UNION ALL` |
| 12 | Online Shop: customers, products, orders |
| ★ | Final Challenge — `JOIN + GROUP BY + COUNT/SUM/AVG + HAVING` |

შემოწმებულია MySQL 8.4.9-ზე: სკრიპტი შეცდომების გარეშე სრულდება.

# Session 4 — Homework

This repository contains the homework tasks for Database Mentorship Session 4.

## Task 1 — Camera Search

### Requirement

Find all products containing the word `camera` in either:

- the product name
- the product description

### Solution

The query uses `ILIKE` so the search is case-insensitive.

It searches both `product_name` and `description`.

See:

`camera-search.sql`

### Tested Result

The query was tested with products containing:

- `Camera`
- `camera`
- `CAMERA`

The expected products were returned.

---

## Task 2 — Product Recommendation

### Requirement

Suggest popular products:

- in the same category as the purchased product
- by the same author
- excluding the purchased product

### Popularity Definition

The task does not define exactly how "popular" should be measured.

For this solution, popularity is defined as:

> Total quantity sold.

Therefore:

```sql
SUM(order_details.quantity)
```

is used as the popularity measure.

### Query Logic

The query:

1. Finds the purchased product.
2. Gets its category and author.
3. Finds other products in the same category.
4. Keeps products by the same author.
5. Excludes the purchased product.
6. Calculates total quantity sold for each product.
7. Sorts the products from most popular to least popular.

### Test Input

For testing:

```text
Purchased product = 101
```

### Tested Result

```text
106 | Mirrorless Camera | 8
102 | Camera Lens       | 5
104 | Camera Bag        | 3
```

The purchased product was excluded successfully.

### Important Assumption

The homework requirement mentions "same author", but the base E-commerce schema shown in the Session 4 material does not define `author_id` in the displayed Product table.

Therefore, this solution assumes that `author_id` exists in the actual product schema.

The purchased product ID (`101`) is only a test input. In a real application, it should come from the order/user context rather than being hard-coded.

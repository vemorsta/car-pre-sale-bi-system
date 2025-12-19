# Power Query Transformations

This document describes the data cleansing and transformation logic implemented
in Power Query as part of the **Car Pre-Sales BI System**.

Due to the nature of Persian-language source data, a significant portion of data
quality issues could not be fully resolved at the SQL level and required advanced
text normalization in Power Query.

---

## Key Data Quality Challenges

- Inconsistent usage of Persian and Arabic characters (ي / ی , ك / ک)
- Presence of invisible Unicode characters (ZWNJ, ZWJ, BOM, NBSP)
- Irregular spacing and hidden separators
- Mixed representation of car brand and car model values in a single field
- Lack of standardized master data for product naming

---

## Transformation Strategy

The transformation logic in Power Query focused on:

- Text trimming and whitespace normalization
- Removal of hidden Unicode characters
- Standardization of Persian characters
- Logical separation of **Car Brand** and **Car Model**
- Preserving analytical accuracy without altering business meaning

---

## Implemented Cleansing Steps

- Removal of zero-width and non-printable Unicode characters
- Replacement of Arabic characters with Persian equivalents
- Collapsing multiple spaces into a single space
- Null handling and safe text conversion
- Controlled matching against a predefined brand reference list

---

## Example Logic (Simplified)

```m
// Simplified Power Query logic for documentation purposes

NormalizedName =
    Text.Trim([CarName])

StandardizedText =
    Text.Replace(
        Text.Replace(NormalizedName, "ي", "ی"),
        "ك", "ک"
    )

CarBrand =
    if List.Contains(BrandList, StandardizedText)
    then StandardizedText
    else null

CarModel =
    if not List.Contains(BrandList, StandardizedText)
    then StandardizedText
    else null

Note:
The full implementation includes additional Unicode normalization steps and
edge-case handling that are intentionally omitted here for clarity and readability.
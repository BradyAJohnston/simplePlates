# SimplePlates

Set of functions for working with data from plate-based assays.

### Installation:
```r
devtools::install_github("bradyajohnston/simplePlates")
```

## Example use cases. 
`create_plate_properties()`

For for generating concentration and contents data for arbitary sections of plates.

```r
> create_plate_properties(LETTERS[1:3], 1:3, 500, "Normal")
  well row_let col_no sample_con well_contents
1   A1       A      1        500        Normal
2   A2       A      2        250        Normal
3   A3       A      3        125        Normal
4   B1       B      1        500        Normal
5   B2       B      2        250        Normal
6   B3       B      3        125        Normal
7   C1       C      1        500        Normal
8   C2       C      2        250        Normal
9   C3       C      3        125        Normal
```

`plate_map()`

Creating visual representation of a plate's contents.

```r
df1 <- create_plate_properties(LETTERS[1:4], 1:12, max_conc = 1000, well_contents = "SampleA")
df2 <- create_plate_properties(LETTERS[5:8], 1:12, max_conc = 1000, well_contents = "SampleB")
dfs <- rbind(df1, df2)
plate_map(dfs, alpha_value = sample_con, colour_value = well_contents)
```

![alt text](https://i.imgur.com/waYPFtk.png "Title Text")

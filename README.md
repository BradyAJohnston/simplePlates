# SimplePlates

Set of functions for working with data from plate-based assays.

>"omg this is the best thing ever i love simplePlates" - Somayra

### Installation:
```r
devtools::install_github("bradyajohnston/simplePlates")
```

## Example use cases. 
### `create_plate_properties()`

For generating concentration and contents data for arbitary sections of plates.

```r
create_plate_properties(
  row_range = LETTERS[1:3], 
  column_range = 1:3, 
  max_conc = 500, 
  well_contents = "SampleA", 
  direction = "horizontal"
)
   well row_let col_no sample_con well_contents
1   A1       A      1        500       SampleA
2   A2       A      2        250       SampleA
3   A3       A      3        125       SampleA
4   B1       B      1        500       SampleA
5   B2       B      2        250       SampleA
6   B3       B      3        125       SampleA
7   C1       C      1        500       SampleA
8   C2       C      2        250       SampleA
9   C3       C      3        125       SampleA

create_plate_properties(
  row_range = LETTERS[1:3], 
  column_range = 1:3, 
  max_conc = 500, 
  well_contents = "SampleA", 
  direction = "vertical", 
  dil_factor = 0.2, 
  constant_concentration = F
)
  well row_let col_no sample_con well_contents
1   A1       A      1        500       SampleA
2   A2       A      2        500       SampleA
3   A3       A      3        500       SampleA
4   B1       B      1        100       SampleA
5   B2       B      2        100       SampleA
6   B3       B      3        100       SampleA
7   C1       C      1         20       SampleA
8   C2       C      2         20       SampleA
9   C3       C      3         20       SampleA
```

### `plate_map()`

Creating a visual map for the contents of a given plate. Takes concentration, well contents to make map.

```r
df1 <- create_plate_properties(LETTERS[1:4], 1:12, max_conc = 1000, well_contents = "SampleA")
df2 <- create_plate_properties(LETTERS[5:8], 1:12, max_conc = 1000, well_contents = "SampleB")
dfs <- rbind(df1, df2)
plate_map(dfs, alpha_value = sample_con, colour_value = well_contents)
```

![alt text](https://i.imgur.com/waYPFtk.png "Title Text")

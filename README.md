
<!-- README.md is generated from README.Rmd. Please edit that file -->

# friends

<!-- badges: start -->

[![R build
status](https://github.com/EmilHvitfeldt/friends/workflows/R-CMD-check/badge.svg)](https://github.com/EmilHvitfeldt/friends/actions)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
<!-- badges: end -->

The goal of friends to provide the complete script transcription of the
[Friends](https://en.wikipedia.org/wiki/Friends) sitcom. The data
originates from the [Character
Mining](https://github.com/emorynlp/character-mining) repository which
includes references to scientific explorations using this data. This
package simply provides the data in tibble format instead of json files.

## Installation

You can install the developmental version of friends from
[Github](http://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("EmilHvitfeldt/friends")
```

## Example

The friends package comes with a couple of datasets. The main one is the
`friends` dataset which is a tibble containing all the utterances in the
show

``` r
library(friends)

friends
#> # A tibble: 67,373 x 6
#>    text                                speaker    season episode scene utterance
#>    <chr>                               <chr>       <int>   <int> <int>     <int>
#>  1 There's nothing to tell! He's just… Monica Ge…      1       1     1         1
#>  2 C'mon, you're going out with the g… Joey Trib…      1       1     1         2
#>  3 All right Joey, be nice. So does h… Chandler …      1       1     1         3
#>  4 Wait, does he eat chalk?            Phoebe Bu…      1       1     1         4
#>  5 (They all stare, bemused.)          Scene Dir…      1       1     1         5
#>  6 Just, 'cause, I don't want her to … Phoebe Bu…      1       1     1         6
#>  7 Okay, everybody relax. This is not… Monica Ge…      1       1     1         7
#>  8 Sounds like a date to me.           Chandler …      1       1     1         8
#>  9 [Time Lapse]                        Scene Dir…      1       1     1         9
#> 10 Alright, so I'm back in high schoo… Chandler …      1       1     1        10
#> # … with 67,363 more rows
```

All the utterances are broken down by `season`, `episode`, `scene` and
`utterance` which allows for very detailed analysis. Please note that
the `speaker` will be denoted `"Scene Directions"` to show scene
directions, or otherwise non-spoken descriptions.

The original data includes emotion and character entity annotation for
some of the utterances. These annotations have been included in separate
tibbles. These can easily be joined back to the main dataset as needed.

``` r
friends_entities
#> # A tibble: 10,557 x 5
#>    season episode scene utterance entities 
#>     <int>   <int> <int>     <int> <list>   
#>  1      1       1     1         2 <chr [1]>
#>  2      1       1     1         3 <chr [2]>
#>  3      1       1     1         4 <chr [1]>
#>  4      1       1     1         8 <chr [1]>
#>  5      1       1     1        31 <chr [2]>
#>  6      1       1     1        33 <chr [1]>
#>  7      1       1     1        34 <chr [1]>
#>  8      1       1     1        38 <chr [1]>
#>  9      1       1     1        42 <chr [4]>
#> 10      1       1     1        44 <chr [1]>
#> # … with 10,547 more rows

friends_emotions
#> # A tibble: 12,606 x 5
#>    season episode scene utterance emotion
#>     <int>   <int> <int>     <int> <chr>  
#>  1      1       1     4         1 Mad    
#>  2      1       1     4         3 Neutral
#>  3      1       1     4         4 Joyful 
#>  4      1       1     4         5 Neutral
#>  5      1       1     4         6 Neutral
#>  6      1       1     4         7 Neutral
#>  7      1       1     4         8 Scared 
#>  8      1       1     4        10 Joyful 
#>  9      1       1     4        11 Joyful 
#> 10      1       1     4        12 Sad    
#> # … with 12,596 more rows
```

There is also a tibble containing episode specific information such as
`title`, `air_date` and `imdb_rating`

``` r
friends_info
#> # A tibble: 236 x 8
#>    season episode title directed_by written_by air_date   us_views_millio…
#>     <int>   <int> <chr> <chr>       <chr>      <date>                <dbl>
#>  1      1       1 The … James Burr… David Cra… 1994-09-22             21.5
#>  2      1       2 The … James Burr… David Cra… 1994-09-29             20.2
#>  3      1       3 The … James Burr… Jeffrey A… 1994-10-06             19.5
#>  4      1       4 The … James Burr… Alexa Jun… 1994-10-13             19.7
#>  5      1       5 The … Pamela Fry… Jeff Gree… 1994-10-20             18.6
#>  6      1       6 The … Arlene San… Adam Chas… 1994-10-27             18.2
#>  7      1       7 The … James Burr… Jeffrey A… 1994-11-03             23.5
#>  8      1       8 The … James Burr… Marta Kau… 1994-11-10             21.1
#>  9      1       9 The … James Burr… Jeff Gree… 1994-11-17             23.1
#> 10      1      10 The … Peter Bone… Adam Chas… 1994-12-15             19.9
#> # … with 226 more rows, and 1 more variable: imdb_rating <dbl>
```

## Code of Conduct

Please note that the friends project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

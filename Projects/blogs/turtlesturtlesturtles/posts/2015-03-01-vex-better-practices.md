---
title: VEX':'Better practices
---


## VEX: Better practices
\

``` c

int index = -1;
float tmp = -1.0f;

for(int i = 0; i < ncount; i++)
{
  nbrnum = neighbour(geoself(), ptnum, i);
	if ( product_list[i] > tmp && not_element_of(visited, nbrnum))
	{
		index = i;
		tmp = product_list[i];
	}
};
	
return index;

```
\

``` c        
int sorted_index[] = argsort(product_list);

for(int i = len(sorted_index)-1; i >= 0; i--)
{
 nbrnum = neighbour(geoself(), ptnum, pop(sorted_index));                             		
 if (not_element_of(visited, nbrnum)){index = nbrnum; break;}
}
		
return index;
```
The latter is go, the former - no go.  (The former is idiomatic to VOPs)
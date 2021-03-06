{literal}
<style type="text/css" media="print">
	#header_pane {
		display: none;
	}
	#main_pane {
 		top: 0px;
 	}
 	#login_pane {
 		display: none;
 	}
</style>
{/literal}

{config_load file=test.conf}
{include file="header.tpl"}


<div id="main_pane">
<h1>Trophy List</h1>




 <table border="3" width="1100px" >
  <tr>
  		<th>
  			Count
  		</th>
 		<th>
 			Tournament Name
 		</th>
 		<th>
 			Tournament Date
 		</th> 		
 		<th>
 			Division
 		</th> 		
		<th>
			Notes
		</th>
  </tr>
  {section name=division loop=$division_list}
	<tr>
		<td align="center" class="trophy_list">
		  {$smarty.section.division.index+1}
		</td>
		<td align="center" class="trophy_list"> 
			{$active_tournament.NAME}
		</td>
		<td align="center" class="trophy_list">
			{$active_tournament.DATE_FROM|date_format:$date}{if $active_tournament.DATE_TO != $active_tournament.DATE_FROM} - {$active_tournament.DATE_TO|date_format:$date}{/if}			
		</td>
		<td align="center" class="trophy_list">
			{$division_list[division].EVENT}, {$division_list[division].DIVISION}
		</td>
		<td align="center" class="trophy_list">
		 	{if $division_list[division].MAX_COMPETITORS == 1}
				{if $division_list[division].MINOR_FINAL == "3rd4th"}
					1st, 2nd, 3rd	
				{elseif $division_list[division].MINOR_FINAL == "3rd3rd"}
					1st, 2nd, 3rd, 3rd		
				{elseif $division_list[division].MINOR_FINAL == "1stonly"}
					1st
				{else}
					1st, 2nd
				{/if}
			{else}
				{if $division_list[division].MINOR_FINAL == "3rd4th"}
					(1st, 2nd, 3rd) x 5
				{elseif $division_list[division].MINOR_FINAL == "3rd3rd"}
					(1st, 2nd, 3rd, 3rd) x 5
				{elseif $division_list[division].MINOR_FINAL == "1stonly"}
					(1st) x 5
				{else}
					(1st, 2nd) x 5
				{/if}
		 	{/if}
		</td>
 	</tr>
 	{/section}
 </table>


</div>

{include file="footer.tpl"}

</body>
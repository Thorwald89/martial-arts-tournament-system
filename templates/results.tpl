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

{if $results_mode == "Get"}
 <form action="{$SCRIPT_NAME}" method="post" enctype="multipart/form-data">
 
	 <h1>Tournament Results</h1>
	 Select the desired tournament and click Get Tournament Results.<br><br>
	 {html_options name=Tournament size=1 options=$tournament_select_list selected=$active_tournament.ID}
	 <input type="submit" value="Get Tournament Results" name="Get_Tournament_Results">

	 <h1>Section Results</h1>
	 Select the desired section and click Get Section Results.<br><br>
	 {html_options name=Section size=1 options=$section_select_list}
	 <input type="submit" value="Get Section Results" name="Get_Section_Results">
	 
	 <h1>Represents Results</h1>
	 Select the desired club/school/country and click Get Represents Results<br><br>
	 {html_options name=Represents size=1 options=$represents_select_list}
	 <input type="submit" value="Get Represents Results" name="Get_Represents_Results">
	 	 
	 <h1>Competitor Results</h1>
	 Enter their first name, last name and date of birth and click Get Competitor Results.<br><br>
	 First Name <input type="text" name="First Name" value="" size="30"><br><br>
	 Last Name <input type="text" name="Last Name" value="" size="30"><br><br>
	 Date of Birth{html_select_date prefix='DOB_' start_year=$DOB_start end_year=$DOB_end field_order='DMY'}<br><br>
	 <input type="submit" value="Get Competitor Results" name="Get_Competitor_Results">
	 
 </form>
{elseif $results_mode == "Tournament"}

	<h1>Results for: {$tournament.NAME}: {$tournament.DATE_FROM|date_format:$date}{if $tournament.DATE_TO != $tournament.DATE_FROM} - {$tournament.DATE_TO|date_format:$date}{/if}</h1>
{if $section_name}
<h2>{$section_name}</h2>
{/if}
	<p>
	
	</p>
	<strong>Overall Champions</strong><br>
	{section name=champ loop=$champs_list}
		{$champs_list[champ].PLACE} - {$champs_list[champ].DESCRIPTION} : {$champs_list[champ].NAME} ({$champs_list[champ].REPRESENTS})<br>
	{/section}
	
	{section name=division loop=$division_list}
	<br>
	<strong>{$division_list[division].SECTION_NAME} - {$division_list[division].EVENT} - <a href="division_draw.php?DIVISION_ID={$division_list[division].DIVISION_ID}">{$division_list[division].DIVISION}</a> </strong>
	 {if $competitor_division_count[division] == 0}
	 	</br>No results yet.<br>
	 {else}
	 <table border="1" class="public_division">
	  <tr>
	  		<th>
	  			Result
	  		</th>
	 		<th>
	 			Name
	 		</th>		
	 		<th>
	 			Represents
	 		</th> 		
			
	  </tr>
	 	{section name=competitor loop=$competitor_list start=$competitor_division_starts[division] max=$competitor_division_count[division]}
		<tr>
			<td>
				{$competitor_list[competitor].RESULT}
			</td>
	 		<td>		
	 			{$competitor_list[competitor].NAME}		
	 		</td>	
	  		<td>
	 			{$competitor_list[competitor].REPRESENTS}
	 		</td>
	 	{/section}	 				
	 	</tr>
	 </table>
	 {/if}
	{/section}
	
{elseif $results_mode == "Represents" || $results_mode == "Competitor"}
	
	{if $results_mode == "Represents"}
	<h1>Represents results for: {$represents_name}</h1>
	{else}
	<h1>Competitor results for: {$competitor_name}</h1>	
	{/if}
	<p>
	
	</p>
	
	<p>
	{if $AT_LEAST_ONE_CHAMPS == 1}
	<strong>Overall Champion Results</strong><br>
	{section name=champ loop=$champs_list}
		{if $champs_list[champ].TOURNAMENT != "" && $champs_list[champ].DESCRIPTION != ""}
			{$champs_list[champ].PLACE} - {$champs_list[champ].DESCRIPTION} : {$champs_list[champ].TOURNAMENT} ({if $results_mode == "Represents"}{$champs_list[champ].NAME}{else}{$champs_list[champ].REPRESENTS}{/if})<br>
		{/if}
	{/section}	
	</p>
	{/if}
	<strong>Results</strong><br>
	
	<table border="1">
	  <tr>
	    <th>Tournament</th>
	    <th>Division</th>
	    {if $results_mode == "Represents"}
	    <th>Name</th>
	    {else}
 		<th>Represents</th>
	  	{/if}
	  	<th>Result</th>		
	  </tr> 		 
	{section name=tournament loop=$tournament_list}
		{section name=division loop=$division_list}
			{if $division_list[division].TOURNAMENT_ID == $tournament_list[tournament].ID}
			 	{if $competitor_division_count[division] != 0}	
				 	{section name=competitor loop=$competitor_list start=$competitor_division_starts[division] max=$competitor_division_count[division]}
					<tr>
						<td>
							{$tournament_list[tournament].NAME} ({$tournament_list[tournament].DATE_FROM|date_format:$date})
						</td>
						<td>
							{$division_list[division].EVENT} - <a href="division_draw.php?DIVISION_ID={$division_list[division].DIVISION_ID}">{$division_list[division].DIVISION}</a>
						</td>
				 		<td>		
				 			{if $results_mode == "Represents"}
	 						{$competitor_list[competitor].NAME}	
	 						{else}	
				 			{$competitor_list[competitor].REPRESENTS}
				 			{/if}		
				 		</td>
						<td align="center">
							{$competitor_list[competitor].RESULT}
						</td>			 			
				 	<tr>
				 	{/section}			 	
			 	
			 	{/if}
		 	{/if}
		 {/section}
	{/section}		
	</table>

{/if}

</div>

{include file="footer.tpl"}

</body>

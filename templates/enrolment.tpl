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

{config_load file=test.conf section="setup"}
{include file="header.tpl"}

<div id="main_pane">

Enrolment: {$active_tournament.NAME} {$active_tournament.DATE_FROM|date_format}{if $active_tournament.DATE_TO != $active_tournament.DATE_FROM} - {$active_tournament.DATE_TO|date_format}{/if} - {$SECTION}

 	{section name=competitor_list loop=$competitors}

{if $smarty.section.competitor_list.index != 0 && $smarty.section.competitor_list.index is div by 10}

<ul class="page_break"  style=" background-color: #eee; padding: 0px 20px 0px 20px;">
<div style=" background-color: #fff;">Enrolment: {$active_tournament.NAME} {$active_tournament.DATE_FROM|date_format}{if $active_tournament.DATE_TO != $active_tournament.DATE_FROM} - {$active_tournament.DATE_TO|date_format}{/if} - {$SECTION}<br></div>

{else}
<ul style=" background-color: #eee; padding: 0px 20px 0px 20px;">
{/if}

 			<b>{$competitors[competitor_list].LAST_NAME|upper}, {$competitors[competitor_list].TITLE} {$competitors[competitor_list].FIRST_NAME}  --- {$competitors[competitor_list].REPRESENTS}</b>

<p style="position: relative; left: 30px;">
 			{$competitors[competitor_list].GENDER} --
 			{$competitors[competitor_list].HEIGHT} cm --
 			{$competitors[competitor_list].WEIGHT} kg --
 			DOB: {$competitors[competitor_list].DOB|date_format} --
 			{$competitors[competitor_list].RANK}
</p>
<p style="position: relative; left: 30px;">
 			{section name=event loop=$active_tournament_events_name start=0 loop=9}
 				{if $competitors_events[competitor_list][event]}
		 			{$active_tournament_events_name[event]}&nbsp;&nbsp;
	 			{/if}	
 			{/section}	
</p>
</ul>
 	 {/section}
</div>

{include file="footer.tpl"}

</body>
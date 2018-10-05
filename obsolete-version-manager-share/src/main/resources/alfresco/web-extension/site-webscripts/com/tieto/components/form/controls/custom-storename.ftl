<#if field.control.params.isAdvanceSearch?? && field.control.params.isAdvanceSearch == "true"><#assign advanceSearch=true><#else><#assign advanceSearch=false></#if>
<#assign storeTypes = ["defaultTenantFileContentStore","fastFileStore","slowFileStore","propertyRoutingStore"]>
<#assign fieldValue=field.value>

<div class="form-field">
 <#if form.mode == "view">
      <div class="viewmode-field" <#if field.description??>title="${field.description}"</#if>>
         <span  <#if field.description??>title="${field.description}"</#if> class="viewmode-label">${field.label?html}:</span>
         <span class="viewmode-value"><#if fieldValue == "">${msg("form.control.novalue")}<#else>${fieldValue}</#if></span>
      </div>
   <#else>
	   <label for="${fieldHtmlId}-label" <#if field.description??>title="${field.description}"</#if>>${field.label?html}:<#if field.mandatory><span class="mandatory-indicator">${msg("form.required.fields.marker")}</span></#if></label>
		<#if field.control.params.size??>size="${field.control.params.size}"</#if> 
		<#if field.control.params.styleClass??>class="${field.control.params.styleClass}"</#if>
		<#if field.control.params.style??>style="${field.control.params.style}"</#if>
		<input class="hidden-dropdown-input" id="${fieldHtmlId}_value" type="hidden" name="${field.name}" value="${fieldValue?string}" />
		
		<div class="form-field dropdown">
		  <select id="${fieldHtmlId}" tabindex="0" class="value-selector"
		    <#if field.description??>title="${field.description}"</#if>
		    <#if field.control.params.size??>size="${field.control.params.size}"</#if>>
		    	<#list storeTypes as optionItem>
		       	<option value="${optionItem}">${optionItem}</option>
		   		</#list>
		  </select>
	  </div>
		<@formLib.renderFieldHelp field=field />
	</#if>
</div>

<script type="text/javascript">//<![CDATA[
	<#if form.mode == "edit" && !advanceSearch>	
		YAHOO.util.Event.onAvailable("${fieldHtmlId}_value", loadSelectedStore, this);
		YAHOO.util.Event.addListener("${fieldHtmlId}", "click", updateValueSelected, this, true);
		var storeTypeEle = document.getElementById("${fieldHtmlId}");
		var hiddenValEle = document.getElementById("${fieldHtmlId}_value");
		
		function loadSelectedStore(){
			if(hiddenValEle.value){
				storeTypeEle.value=hiddenValEle.value
			}
			
			var index = storeTypeEle.options.selectedIndex;
			if (index > 0){
				storeTypeEle.options[index].disabled = true;
			}else{				
				return this;
			}
			
		}
		function updateValueSelected(){
			
		if (storeTypeEle.disabled == true){
				return ;
			}
			var index = storeTypeEle.options.selectedIndex;
			var tempValue  = "";
			if (index > 0){
				tempValue = storeTypeEle.options[index].value;
			}else{				
				return this;
			}
			
			var selectedVal = tempValue;
			console.log(selectedVal);
			hiddenValEle.value = selectedVal;
			return;
		}
	</#if>
	<#if advanceSearch>
	var fieldId = "${fieldHtmlId}";
			if(fieldId.indexOf("prop_cm_storeName")> -1){
			
				YAHOO.util.Event.addListener("${fieldHtmlId}", "click", updateValueSelectedSearch, this, true);
				
				function updateValueSelectedSearch(){
				var storeTypeEle = document.getElementById("${fieldHtmlId}");
				var hiddenValEle = document.getElementById("${fieldHtmlId}_value");	
				if (storeTypeEle.disabled == true){
						return ;
					}
					var index = storeTypeEle.options.selectedIndex;
					var tempValue  = "";
					if (index > 0){
						tempValue = storeTypeEle.options[index].value;
					}else{				
						return this;
					}
					
					var selectedVal = tempValue;
					console.log(selectedVal);
					hiddenValEle.value = selectedVal;
					return;
				}
			}
	</#if>
//]]></script>
<#include "layout.ftl">

<#macro content>
<link href="/css/tables.css" rel="stylesheet">
<div class="add-table-container add-table-container-close">
        <div class="container add-table-modal py-3">
            <div class="row spreadsheet-select align-items-center align-content-between justify-content-around overlow-hidden gap-3">
                select a Spreadsheet
                <select  name="spreadsheet" class="col-3 spreadsheet-selecting">
                <#if user.repository.spreadsheets??>
                    <#list user.repository.spreadsheets as spreadsheet>
                        <option value="${spreadsheet.id}">${spreadsheet.name}</option>
                    </#list>
                </#if>
                    
                   
                </select>
                <div class="col-1 d-flex align-items-center justify-content-center">or</div>
                <div class="row col-5 row-link d-flex justify-content-between align-items-center">
                    <input name="spreadsheetId" class="sheet-id col-5"placeholder="ID...">
                    <button class="import-sheet-link col-3" >Import</button>
                </div>
            
            </div>
            <hr>
            <div class="row sheet-select align-items-center justify-content-around overlow-hidden  mt-4 mb-3">
                <div class="col-4">
                table name
                <input name="table_name" class="table-name">
                </div>
                <div class="col-5">
                select a sheet <br>
                  <#if user.repository.spreadsheets??>
                <#list user.repository.spreadsheets as spreadsheet>
                    <select class="select-${spreadsheet.id} select-sheet <#if spreadsheet?index != 0>d-none</#if>" >
                    <#list spreadsheet.data?keys as sheet>
                    <option>${sheet}</option>
                    
                    </#list>
                    </select>
                </#list>
                </#if>
                <div class="row">
                 <input type="checkbox" class="d-flex mx-3" style="width:1rem;" > Ignore first line
                </div>
                
                </div>
            </div>
            <i class="fa-solid fa-caret-down  drop-down-close"></i>Advanced
            <hr class="mt-0">
            <div class="row container advaced-option d-flex justify-content-start " >
            
            <div class="row" style="width:100%;">
            <div class="col-5 border-end">
            <#assign alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ">
                <#list user.repository.spreadsheets as spreadsheet>
                    <#list spreadsheet.data as sheet,data >
                <table class="table table-borderless range-${sheet}-${spreadsheet.id} d-none text-center" style="width:10rem;">
                    <thead>
                        <th scope="col"></th>
                        <th scope="col">Ligne</th>
                        <th scope="col">Column</th>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">Start</th>
                            <td>
                                <select >
                                    <#list data as row>
                                    <option >${alphabet[row?index]}</option>
                                   </#list>
                                </select>
                                    
                                
                                
                            </td>
                            <td>
                                
                                <select  class="${sheet}-${spreadsheet.id} d-none">
                                    <#list data[0] as column >
                                        
                                    <option >${column?index}</option>
                                   </#list>
                                </select>
                                    
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">End</th>
                            <td>
                                <select >
                                    <#list data as row>
                                    <option >${alphabet[row?index]}</option>
                                   </#list>
                                </select>
                            </td>
                            <td>
                                 <select  class="${sheet}-${spreadsheet.id} d-none">
                                    <#list data[0] as column >
                                        
                                    <option >${column?index}</option>
                                   </#list>
                                </select>
                            </td>
                            
                        </tr>
                    </tbody>

                </table>
                </#list>
            </#list>  
                </div>
                <div class="col-5 columns-name-container">
                </div>
             </div>   
                
            </div>
            <div class="row d-flex justify-content-end self-align-end p-3" >
            <button class="btn btn-brown col-1 creat-table">Create</button>
            </div>
        </div>

</div>
    
<div class="tables-container container  overflow-scroll">
    <#if tables??>
    <#list tables as table>
        <table class="table table-bordered" >
            <thead>
                <th scope="column " colspan="${table.data[0]?size}" >${table.name}<th>
            </thead>
            <tbody>
                <#list table.data as row>
                    <tr>
                        <#list row as column>
                            <td>${column}</td>
                        
                        </#list>
                    <tr>
                </#list>
            </tbody>
        </table>
    
    
    </#list>
    </#if>



</div>
<button class="add-table rounded-circle"><i class="fa-solid fa-plus fa-xl"></i></button>
<script src="/js/tables.js"></script>

</#macro>
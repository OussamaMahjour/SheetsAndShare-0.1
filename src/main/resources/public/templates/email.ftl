<#include "layout.ftl">

<#macro content>
        <link href="/css/email.css" rel="stylesheet">
        <div class="container">
        
            <div class="row ">

            <table>
                <thead>
                    <th scope="column" ></th>
                    <th scope="column"></th>
                </thead>
                <tbody >
                    <tr >
                        <td >
                            destination 
                        </td>
                        <td class="p-3">
                         <select style="width:50%; height:2rem;" class="mx-4">
                                 <option>destination</option>
                         </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            subject
                        </td>
                        <td class="p-3">
                            <input style="width:50%;" class="form-control  mx-4">

                        </td>

                    </tr>
                </tbody>

            </table>
           
           
            </div>
            <hr>
            <div class="row d-flex justify-content-center">
                <button class="compile" >Compile</button>
            
            </div>
            <div class="row d-flex justify-content-center" style="height:30rem !important;">
                <div class="col-5 p-3">
                    <textarea class="border rounded border-dark p-2 bg-white" style="height:100%;width:100%;"> </textarea>
                </div>
                <div class="col-5 p-3">
                    <div class="border rounded border-dark p-2" style="height:100%;width:100%;"></div>
                </div>

            </div>
            

        
        
        <div>
</#macro>
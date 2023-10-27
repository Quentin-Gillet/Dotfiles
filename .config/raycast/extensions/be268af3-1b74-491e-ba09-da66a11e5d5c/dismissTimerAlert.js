"use strict";var m=Object.defineProperty;var p=Object.getOwnPropertyDescriptor;var g=Object.getOwnPropertyNames;var S=Object.prototype.hasOwnProperty;var T=(e,i)=>{for(var s in i)m(e,s,{get:i[s],enumerable:!0})},h=(e,i,s,t)=>{if(i&&typeof i=="object"||typeof i=="function")for(let o of g(i))!S.call(e,o)&&o!==s&&m(e,o,{get:()=>i[o],enumerable:!(t=p(i,o))||t.enumerable});return e};var y=e=>h(m({},"__esModule",{value:!0}),e);var w={};T(w,{default:()=>$});module.exports=y(w);var n=require("@raycast/api"),d=require("fs");var r=require("@raycast/api");var a=require("fs"),u=require("path");var l=e=>(e.d1=e.d1=="----"?void 0:e.d1,e.d2=e.d2=="----"?void 0:e.d2,Math.round((e.d1?new Date(e.d1):new Date).getTime()-(e.d2?new Date(e.d2):new Date).getTime())/1e3);var F=r.environment.supportPath+"/customTimers.json";function f(){let e=[];return(0,a.readdirSync)(r.environment.supportPath).forEach(s=>{if((0,u.extname)(s)==".timer"){let t={name:"",secondsSet:-99,timeLeft:-99,originalFile:s,timeEnds:new Date};t.name=(0,a.readFileSync)(r.environment.supportPath+"/"+s).toString();let o=s.split("---");t.secondsSet=Number(o[1].split(".")[0]);let c=o[0].replace(/__/g,":");t.timeLeft=Math.max(0,Math.round(t.secondsSet-l({d2:c}))),t.timeEnds=new Date(c),t.timeEnds.setSeconds(t.timeEnds.getSeconds()+t.secondsSet),e.push(t)}}),e.sort((s,t)=>s.timeLeft-t.timeLeft),e}var $=async()=>{if(!(0,n.getPreferenceValues)().ringContinuously)return await(0,n.showToast)({style:n.Toast.Style.Failure,title:"Ring Continuously setting not enabled!"});let e=f();if(e.filter(s=>s.timeLeft===0),e.length===0)return await(0,n.showToast)({style:n.Toast.Style.Failure,title:"No finished timers found!"});await(0,n.closeMainWindow)();let i=e[0].originalFile.replace(".timer",".dismiss");(0,d.unlinkSync)(n.environment.supportPath+"/"+i)};

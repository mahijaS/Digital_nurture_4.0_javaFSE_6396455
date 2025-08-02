import React from "react";

const ScoreBelow70 = ({players}) => {
    const players70 = [];
    {players.map((item,index)=>{
        if(item.score<=70){
            players70.push(item);
        }
    })};
    return(
        <div>
            {players70.map((item,index)=>(
                <li key = {index}>Mr. {item.name} <span>{item.score}</span></li>
            ))}
        </div>
        
    );
}
export default ScoreBelow70;

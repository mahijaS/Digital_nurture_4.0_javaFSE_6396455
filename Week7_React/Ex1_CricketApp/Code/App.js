
import './App.css';
import ListOfPlayers from './components/ListOfPlayers';
import ScoreBelow70 from './components/ScoreBelow70';
import {OddPlayers} from './components/OddPlayers';
import {EvenPlayers} from './components/EvenPlayers';
import ListofIndianPlayers from './components/ListOfIndianPlayers';

function App() {
  const flag = true;
  const players = [
  { name: "Arjun", score: 45 },
  { name: "Karan", score: 68 },
  { name: "Neha", score: 55 },
  { name: "Ravi", score: 73 },
  { name: "Simran", score: 82 },
  { name: "Amit", score: 91 },
  { name: "Priya", score: 100 },
  { name: "Raj", score: 37 },
  { name: "Divya", score: 69 },
  { name: "Kabir", score: 78 },
  { name: "Isha", score: 62 }
];


  const T20Players = ['First Player', 'Second Player', 'Third Player'];
  const RanjiTrophyPlayers = ['Fourth Player', 'Fifth Player', 'Sixth Player'];
  const IndianPlayers = [...T20Players, ...RanjiTrophyPlayers];

  const IndianTeam = ['Sachin1', 'Dhoni2', 'Virat3', 'Rohit4', 'Yuvaraj5', 'Raina6'];

  if(flag==true){
    return(
      <div>
        <h1>List of Players</h1>
        <ListOfPlayers players = {players}/>

        <hr/>
        <h1>List of Players having score less than 70</h1>
        <ScoreBelow70 players = {players}/>


      </div>
      

    );
  }
  else{
    return(
      <div>
        <div>
          <h1>Indian Team</h1>
          <h1>Odd Players</h1>
          {OddPlayers(IndianTeam)}
          <hr />
          <h1>Even Players</h1>
          {EvenPlayers(IndianTeam)}
        </div>
        <hr />
        <div>
          <h1>List of Indian Players Merged:</h1>
          <ListofIndianPlayers IndianPlayers={IndianPlayers} />
        </div>
      </div>
    )
  }
}

export default App;

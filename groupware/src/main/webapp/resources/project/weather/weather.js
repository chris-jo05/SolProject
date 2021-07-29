/**
 *  ${place}
 */
//10. HTML 삽입
const weather = document.querySelector(".js-weather");

//8. API KEY 입력 : API 제공기업에서 API키를 통해 서버에 무리갈 만큼 요청하는지 확인
const API_KEY = "eb32e28b6192f983f47990af2aca7a05";
//3.변수 선언
const COORDS = 'coords';

//9. API 함수
function getWeather(lat, lng) {
    fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&appid=${API_KEY}&lang=kr&units=metric`).then(function (response) {
        return response.json();
    })
        .then(function (json) {
            const temperature = json.main.temp;
            const place = json.name;

            let Icon = {
                '01': 'fas fa-sun',
                '02': 'fas fa-cloud-sun',
                '03': 'fas fa-cloud',
                '04': 'fas fa-cloud-meatball',
                '09': 'fas fa-cloud-sun-rain',
                '10': 'fas fa-cloud-showers-heavy',
                '11': 'fas fa-poo-storm',
                '13': 'far fa-snowflake',
                '50': 'fas fa-smog'
            };

            const weatherIcon = (json.weather[0].icon).substr(0, 2);

            weather.innerHTML = `<div>서울시</div>
            					 <div class="text-center">${temperature}° <i class="${Icon[weatherIcon]}"></i></div>`;
        });
}

//7. 좌표 저장
function saveCoords(coordsObj) { // localStorage에 저장
    localStorage.setItem(COORDS, JSON.stringify(coordsObj)); //stringify : string 값으로 저장
}

//5. 좌표를 가져오는데 성공했을때 처리하는 함수
function handleGeoSucces(position) {
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;
    const coordsObj = {
        latitude, //객체의 변수 이름과 키의 이름을 갖게 하려면 키 값은 버리고 ,를 적어준다.
        longitude
    };
    saveCoords(coordsObj); // 가져온 좌표 localStorage에 저장 함수
    getWeather(latitude, longitude); //API를 통해 날씨를 가져옴
}

//6. 현재 좌표 가져오기 거절 시 처리 함수
function handleGeoError() {
    console.log("Can't access geo location");
}

//4.좌표 요청 함수
function askForCoords() {
    navigator.geolocation.getCurrentPosition(handleGeoSucces, handleGeoError) //// 사용자 위치 요청 (요청 수락, 요청 거절)
}

//2. if문
function loadCoords() {
    const loadedCoords = localStorage.getItem(COORDS); //localStorage에 있는 값을 가져오고
    if (loadedCoords === null) { //값이 없으면 
        askForCoords(); //좌표요청
    } else { //있으면 날씨 표시
        const parsedCoords = JSON.parse(loadedCoords);
        getWeather(parsedCoords.latitude, parsedCoords.longitude);
    }
}

//1. init
function init() {
    loadCoords();
}

init();

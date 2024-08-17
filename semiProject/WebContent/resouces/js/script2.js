document.addEventListener('DOMContentLoaded', function () {
    const userRatioCtx = document.getElementById('userRatioChart').getContext('2d');
    const genderRatioCtx = document.getElementById('genderRatioChart').getContext('2d');
    const ageRatioCtx = document.getElementById('ageRatioChart').getContext('2d');
    const travelTrafficRatioCtx = document.getElementById('travelTrafficRatioChart').getContext('2d');

    const chartOptions = {
        type: 'doughnut',
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'top',
                }
            }
        }
    };

    new Chart(userRatioCtx, {
        ...chartOptions,
        data: {
            labels: ['회원', '비회원'],
            datasets: [{
                data: [50, 50],
                backgroundColor: ['rgba(75, 192, 192, 0.2)', 'rgba(255, 99, 132, 0.2)'],
                borderColor: ['rgba(75, 192, 192, 1)', 'rgba(255, 99, 132, 1)'],
                borderWidth: 1
            }]
        }
    });

    new Chart(genderRatioCtx, {
        ...chartOptions,
        data: {
            labels: ['남', '여'],
            datasets: [{
                data: [25, 25],
                backgroundColor: ['rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)'],
                borderColor: ['rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)'],
                borderWidth: 1
            }]
        }
    });

    new Chart(ageRatioCtx, {
        ...chartOptions,
        data: {
            labels: ['20대', '30대', '40대', '50대'],
            datasets: [{
                data: [20, 50, 20, 10],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)'
                ],
                borderWidth: 1
            }]
        }
    });

    new Chart(travelTrafficRatioCtx, {
        ...chartOptions,
        data: {
            labels: ['국내여행', '해외여행'],
            datasets: [{
                data: [30, 70],
                backgroundColor: ['rgba(255, 159, 64, 0.2)', 'rgba(75, 192, 192, 0.2)'],
                borderColor: ['rgba(255, 159, 64, 1)', 'rgba(75, 192, 192, 1)'],
                borderWidth: 1
            }]
        }
    });
});

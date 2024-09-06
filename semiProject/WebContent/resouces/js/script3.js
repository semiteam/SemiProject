document.addEventListener('DOMContentLoaded', function () {
    const weeklyRevenueCtx = document.getElementById('compare-chart').getContext('2d');
    const categoryViewCtx = document.getElementById('category-view-chart').getContext('2d');

    const barChartOptions = {
        type: 'bar',
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                x: {
                    beginAtZero: true
                },
                y: {
                    beginAtZero: true
                }
            },
            plugins: {
                legend: {
                    display: false
                }
            }
        }
    };

    new Chart(weeklyRevenueCtx, {
        ...barChartOptions,
        data: {
            labels: ['월', '화', '수', '목', '금', '토', '일'],
            datasets: [{
                label: '수익',
                data: [100, 150, 80, 200, 300, 400, 250],
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        }
    });

    new Chart(categoryViewCtx, {
        ...barChartOptions,
        data: {
            labels: ['서울', '부산', '경주'],
            datasets: [{
                label: '조회수',
                data: [300, 500, 400],
                backgroundColor: 'rgba(153, 102, 255, 0.2)',
                borderColor: 'rgba(153, 102, 255, 1)',
                borderWidth: 1
            }]
        }
    });
});

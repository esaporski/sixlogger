# SixLogger

<!-- markdownlint-disable MD033 -->
[![Language](https://img.shields.io/github/languages/top/esaporski/sixlogger.svg)](https://github.com/esaporski/sixlogger/search?l=Shell)
[![kcov](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fesaporski.github.io%2Fsixlogger%2Fcoverage.json&query=percent_covered&label=kcov&suffix=%25)](https://esaporski.github.io/sixlogger/)
[![License](https://img.shields.io/github/license/esaporski/sixlogger.svg)](https://github.com/esaporski/sixlogger/blob/master/LICENSE)<br>
![BusyBox](https://img.shields.io/badge/BusyBox-blue.svg?logo=data:image/svg%2bxml;base64,PHN2ZyBmaWxsPSIjZmZmZmZmZmYiIGhlaWdodD0iNjAwIiB3aWR0aD0iNjAwIiB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHZpZXdCb3g9IjAgMCAzNTMuMzQ3IDM1My4zNDciIHhtbDpzcGFjZT0icHJlc2VydmUiPjxnIGlkPSJTVkdSZXBvX2JnQ2FycmllciIgc3Ryb2tlLXdpZHRoPSIwIj48L2c+PGcgaWQ9IlNWR1JlcG9fdHJhY2VyQ2FycmllciIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIj48L2c+PGcgaWQ9IlNWR1JlcG9faWNvbkNhcnJpZXIiPjxwYXRoIGQ9Ik0zNDkuMzksMTQ1Ljc5NmwtNDguODM3LTI2LjE4bDM5LjAwNS0yNi4yOWMyLjIxMi0xLjQ5LDMuNDY1LTQuMDQzLDMuMjkzLTYuNzA0Yy0wLjE3Mi0yLjY2MS0xLjc0NC01LjAzMS00LjEzLTYuMjI0IEwyMjguNzE2LDI1LjM4MWMtMi4zMjUtMS4xNjMtNS4wODktMS4wMzktNy4zMDQsMC4zMzJsLTQ0LjczOCwyNy43MTJsLTQ0LjczOC0yNy43MTJjLTIuMjEzLTEuMzcxLTQuOTc4LTEuNDk1LTcuMzA0LTAuMzMyIEwxNC42MjYsODAuMzk5Yy0yLjM4NiwxLjE5My0zLjk1OCwzLjU2My00LjEzLDYuMjI0Yy0wLjE3MiwyLjY2MSwxLjA4MSw1LjIxMywzLjI5Myw2LjcwNGwzOS4wMDUsMjYuMjlsLTQ4LjgzNywyNi4xOCBjLTIuMzg2LDEuMjc5LTMuODk3LDMuNzQ0LTMuOTU1LDYuNDVjLTAuMDU5LDIuNzA2LDEuMzQ3LDUuMjMzLDMuNjc1LDYuNjEzbDEwOC45NTUsNjQuNTYzYzEuMTc3LDAuNjk4LDIuNDk5LDEuMDQ4LDMuODIzLDEuMDQ4IGMxLjIxNywwLDIuNDM2LTAuMjk2LDMuNTQ0LTAuODlsNDkuMTc1LTI2LjM2MXYxMTEuODlMNzQuNDM0LDI2MS42M3YtNDMuMjY4YzAtNC4xNDItMy4zNTctNy41LTcuNS03LjVzLTcuNSwzLjM1OC03LjUsNy41djQ3Ljg5OCBjMCwyLjgzOCwxLjYwMyw1LjQzNCw0LjE0LDYuNzA1bDEwOS43MzksNTQuOTk2YzAuMDcxLDAuMDM1LDAuMTQ1LDAuMDYsMC4yMTYsMC4wOTNjMC4xMTcsMC4wNTQsMC4yMzQsMC4xMDQsMC4zNTMsMC4xNTIgYzAuMTg2LDAuMDc1LDAuMzczLDAuMTQsMC41NjIsMC4xOTljMC4xMTUsMC4wMzYsMC4yMjksMC4wNzMsMC4zNDYsMC4xMDNjMC4yMDYsMC4wNTQsMC40MTQsMC4wOTQsMC42MjMsMC4xMjkgYzAuMTA2LDAuMDE4LDAuMjEsMC4wNDIsMC4zMTcsMC4wNTVjMC4yODEsMC4wMzYsMC41NjQsMC4wNTUsMC44NDcsMC4wNThjMC4wMzQsMCwwLjA2NywwLjAwNywwLjEwMSwwLjAwNyBjMC4zMTksMCwwLjYzOS0wLjAyNiwwLjk1OS0wLjA2OGMwLjA3OS0wLjAxLDAuMTU3LTAuMDI4LDAuMjM3LTAuMDQxYzAuMjM0LTAuMDM4LDAuNDY3LTAuMDg1LDAuNjk5LTAuMTQ2IGMwLjEwOC0wLjAyOCwwLjIxMy0wLjA2MiwwLjMyLTAuMDk1YzAuMTk5LTAuMDYyLDAuMzk2LTAuMTMyLDAuNTkyLTAuMjEyYzAuMTE3LTAuMDQ3LDAuMjMyLTAuMDk2LDAuMzQ3LTAuMTQ5IGMwLjA2Ny0wLjAzMSwwLjEzNS0wLjA1MywwLjIwMS0wLjA4NmwxMDkuNzM5LTU0Ljk5NmMyLjUzNy0xLjI3MSw0LjE0LTMuODY3LDQuMTQtNi43MDV2LTQ3Ljg5OGMwLTQuMTQyLTMuMzU3LTcuNS03LjUtNy41IHMtNy41LDMuMzU4LTcuNSw3LjV2NDMuMjY4bC05NC43MzksNDcuNDc4VjE5Ny4yMThsNDkuMTc1LDI2LjM2MWMxLjEwOCwwLjU5NCwyLjMyNywwLjg5LDMuNTQ0LDAuODkgYzEuMzI0LDAsMi42NDYtMC4zNSwzLjgyMy0xLjA0OGwxMDguOTU1LTY0LjU2M2MyLjMyOC0xLjM3OSwzLjczMy0zLjkwNywzLjY3NS02LjYxMyBDMzUzLjI4OCwxNDkuNTM5LDM1MS43NzYsMTQ3LjA3NSwzNDkuMzksMTQ1Ljc5NnogTTE3Ni42NzQsMTc1Ljk3bC05My45ODgtNTUuNjkzbDkzLjk4OC00OS41NTFsOTMuOTg4LDQ5LjU1MUwxNzYuNjc0LDE3NS45N3ogTTIyNS43NTEsNDAuNjdsOTQuNzcxLDQ3LjM5OGwtMzQuNTgxLDIzLjMwN2wtOTQuMTgtNDkuNjUyTDIyNS43NTEsNDAuNjd6IE0xMjcuNTk2LDQwLjY3bDMzLjk4OSwyMS4wNTRsLTk0LjE4LDQ5LjY1MiBMMzIuODI1LDg4LjA2OEwxMjcuNTk2LDQwLjY3eiBNMTE2LjYzOSwyMDguMzZsLTkzLjg3NS01NS42MjdsNDQuNzctMjRsOTMuODc1LDU1LjYyNkwxMTYuNjM5LDIwOC4zNnogTTIzNi43MDgsMjA4LjM2bC00NC43Ny0yNCBsOTMuODc1LTU1LjYyNmw0NC43NywyNEwyMzYuNzA4LDIwOC4zNnoiPjwvcGF0aD48L2c+PC9zdmc+Cg==)
![GNU Coreutils](https://img.shields.io/badge/GNU%20Coreutils-A42E2B?logo=gnu)
![FreeBSD BaseUtils](https://img.shields.io/badge/FreeBSD%20BaseUtils-AB2B28?logo=freebsd)<br>
![sh](https://img.shields.io/badge/sh-cec7d1.svg?logo=data:image/svg%2bxml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgZmlsbD0iIzAwMDAwMCI+PGcgaWQ9IlNWR1JlcG9fYmdDYXJyaWVyIiBzdHJva2Utd2lkdGg9IjAiPjwvZz48ZyBpZD0iU1ZHUmVwb190cmFjZXJDYXJyaWVyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiPjwvZz48ZyBpZD0iU1ZHUmVwb19pY29uQ2FycmllciI+IDx0aXRsZT50ZXJtaW5hbDwvdGl0bGU+IDxkZXNjPkNyZWF0ZWQgd2l0aCBza2V0Y2h0b29sLjwvZGVzYz4gPGcgaWQ9InByb2R1Y3Rpb24iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPiA8ZyBpZD0idGVybWluYWwiIGZpbGw9IiMwMDAwMDAiIGZpbGwtcnVsZT0ibm9uemVybyI+IDxwYXRoIGQ9Ik00LDQgTDIwLDQgQzIxLjEwNDU2OTUsNCAyMiw0Ljg5NTQzMDUgMjIsNiBMMjIsMTggQzIyLDE5LjEwNDU2OTUgMjEuMTA0NTY5NSwyMCAyMCwyMCBMNCwyMCBDMi44OTU0MzA1LDIwIDIsMTkuMTA0NTY5NSAyLDE4IEwyLDYgQzIsNC44OTU0MzA1IDIuODk1NDMwNSw0IDQsNCBaIE00LDYgTDQsMTggTDIwLDE4IEwyMCw2IEw0LDYgWiBNMTIsMTQgTDE4LDE0IEwxOCwxNiBMMTIsMTYgTDEyLDE0IFogTTEwLjk4NTI4MTQsMTEuNTcxMDY3OCBMNy40NDk3NDc0NywxNS4xMDY2MDE3IEw2LjAzNTUzMzkxLDEzLjY5MjM4ODIgTDguMTU2ODU0MjUsMTEuNTcxMDY3OCBMNi4wMzU1MzM5MSw5LjQ0OTc0NzQ3IEw3LjQ0OTc0NzQ3LDguMDM1NTMzOTEgTDEwLjk4NTI4MTQsMTEuNTcxMDY3OCBaIiBpZD0iU2hhcGUiPiA8L3BhdGg+IDwvZz4gPC9nPiA8L2c+PC9zdmc+Cg==)
![bash](https://img.shields.io/badge/bash-cec7d1.svg?logo=gnubash&logoColor=black)
![dash](https://img.shields.io/badge/dash-cec7d1.svg?logo=data:image/svg%2bxml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgZmlsbD0iIzAwMDAwMCI+PGcgaWQ9IlNWR1JlcG9fYmdDYXJyaWVyIiBzdHJva2Utd2lkdGg9IjAiPjwvZz48ZyBpZD0iU1ZHUmVwb190cmFjZXJDYXJyaWVyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiPjwvZz48ZyBpZD0iU1ZHUmVwb19pY29uQ2FycmllciI+IDx0aXRsZT50ZXJtaW5hbDwvdGl0bGU+IDxkZXNjPkNyZWF0ZWQgd2l0aCBza2V0Y2h0b29sLjwvZGVzYz4gPGcgaWQ9InByb2R1Y3Rpb24iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPiA8ZyBpZD0idGVybWluYWwiIGZpbGw9IiMwMDAwMDAiIGZpbGwtcnVsZT0ibm9uemVybyI+IDxwYXRoIGQ9Ik00LDQgTDIwLDQgQzIxLjEwNDU2OTUsNCAyMiw0Ljg5NTQzMDUgMjIsNiBMMjIsMTggQzIyLDE5LjEwNDU2OTUgMjEuMTA0NTY5NSwyMCAyMCwyMCBMNCwyMCBDMi44OTU0MzA1LDIwIDIsMTkuMTA0NTY5NSAyLDE4IEwyLDYgQzIsNC44OTU0MzA1IDIuODk1NDMwNSw0IDQsNCBaIE00LDYgTDQsMTggTDIwLDE4IEwyMCw2IEw0LDYgWiBNMTIsMTQgTDE4LDE0IEwxOCwxNiBMMTIsMTYgTDEyLDE0IFogTTEwLjk4NTI4MTQsMTEuNTcxMDY3OCBMNy40NDk3NDc0NywxNS4xMDY2MDE3IEw2LjAzNTUzMzkxLDEzLjY5MjM4ODIgTDguMTU2ODU0MjUsMTEuNTcxMDY3OCBMNi4wMzU1MzM5MSw5LjQ0OTc0NzQ3IEw3LjQ0OTc0NzQ3LDguMDM1NTMzOTEgTDEwLjk4NTI4MTQsMTEuNTcxMDY3OCBaIiBpZD0iU2hhcGUiPiA8L3BhdGg+IDwvZz4gPC9nPiA8L2c+PC9zdmc+Cg==)
![ksh93u+m](https://img.shields.io/badge/ksh93u+m-cec7d1.svg?logo=data:image/svg%2bxml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgZmlsbD0iIzAwMDAwMCI+PGcgaWQ9IlNWR1JlcG9fYmdDYXJyaWVyIiBzdHJva2Utd2lkdGg9IjAiPjwvZz48ZyBpZD0iU1ZHUmVwb190cmFjZXJDYXJyaWVyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiPjwvZz48ZyBpZD0iU1ZHUmVwb19pY29uQ2FycmllciI+IDx0aXRsZT50ZXJtaW5hbDwvdGl0bGU+IDxkZXNjPkNyZWF0ZWQgd2l0aCBza2V0Y2h0b29sLjwvZGVzYz4gPGcgaWQ9InByb2R1Y3Rpb24iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPiA8ZyBpZD0idGVybWluYWwiIGZpbGw9IiMwMDAwMDAiIGZpbGwtcnVsZT0ibm9uemVybyI+IDxwYXRoIGQ9Ik00LDQgTDIwLDQgQzIxLjEwNDU2OTUsNCAyMiw0Ljg5NTQzMDUgMjIsNiBMMjIsMTggQzIyLDE5LjEwNDU2OTUgMjEuMTA0NTY5NSwyMCAyMCwyMCBMNCwyMCBDMi44OTU0MzA1LDIwIDIsMTkuMTA0NTY5NSAyLDE4IEwyLDYgQzIsNC44OTU0MzA1IDIuODk1NDMwNSw0IDQsNCBaIE00LDYgTDQsMTggTDIwLDE4IEwyMCw2IEw0LDYgWiBNMTIsMTQgTDE4LDE0IEwxOCwxNiBMMTIsMTYgTDEyLDE0IFogTTEwLjk4NTI4MTQsMTEuNTcxMDY3OCBMNy40NDk3NDc0NywxNS4xMDY2MDE3IEw2LjAzNTUzMzkxLDEzLjY5MjM4ODIgTDguMTU2ODU0MjUsMTEuNTcxMDY3OCBMNi4wMzU1MzM5MSw5LjQ0OTc0NzQ3IEw3LjQ0OTc0NzQ3LDguMDM1NTMzOTEgTDEwLjk4NTI4MTQsMTEuNTcxMDY3OCBaIiBpZD0iU2hhcGUiPiA8L3BhdGg+IDwvZz4gPC9nPiA8L2c+PC9zdmc+Cg==)
![loksh](https://img.shields.io/badge/loksh-cec7d1.svg?logo=data:image/svg%2bxml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgZmlsbD0iIzAwMDAwMCI+PGcgaWQ9IlNWR1JlcG9fYmdDYXJyaWVyIiBzdHJva2Utd2lkdGg9IjAiPjwvZz48ZyBpZD0iU1ZHUmVwb190cmFjZXJDYXJyaWVyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiPjwvZz48ZyBpZD0iU1ZHUmVwb19pY29uQ2FycmllciI+IDx0aXRsZT50ZXJtaW5hbDwvdGl0bGU+IDxkZXNjPkNyZWF0ZWQgd2l0aCBza2V0Y2h0b29sLjwvZGVzYz4gPGcgaWQ9InByb2R1Y3Rpb24iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPiA8ZyBpZD0idGVybWluYWwiIGZpbGw9IiMwMDAwMDAiIGZpbGwtcnVsZT0ibm9uemVybyI+IDxwYXRoIGQ9Ik00LDQgTDIwLDQgQzIxLjEwNDU2OTUsNCAyMiw0Ljg5NTQzMDUgMjIsNiBMMjIsMTggQzIyLDE5LjEwNDU2OTUgMjEuMTA0NTY5NSwyMCAyMCwyMCBMNCwyMCBDMi44OTU0MzA1LDIwIDIsMTkuMTA0NTY5NSAyLDE4IEwyLDYgQzIsNC44OTU0MzA1IDIuODk1NDMwNSw0IDQsNCBaIE00LDYgTDQsMTggTDIwLDE4IEwyMCw2IEw0LDYgWiBNMTIsMTQgTDE4LDE0IEwxOCwxNiBMMTIsMTYgTDEyLDE0IFogTTEwLjk4NTI4MTQsMTEuNTcxMDY3OCBMNy40NDk3NDc0NywxNS4xMDY2MDE3IEw2LjAzNTUzMzkxLDEzLjY5MjM4ODIgTDguMTU2ODU0MjUsMTEuNTcxMDY3OCBMNi4wMzU1MzM5MSw5LjQ0OTc0NzQ3IEw3LjQ0OTc0NzQ3LDguMDM1NTMzOTEgTDEwLjk4NTI4MTQsMTEuNTcxMDY3OCBaIiBpZD0iU2hhcGUiPiA8L3BhdGg+IDwvZz4gPC9nPiA8L2c+PC9zdmc+Cg==)
![mksh](https://img.shields.io/badge/mksh-cec7d1.svg?logo=data:image/svg%2bxml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgZmlsbD0iIzAwMDAwMCI+PGcgaWQ9IlNWR1JlcG9fYmdDYXJyaWVyIiBzdHJva2Utd2lkdGg9IjAiPjwvZz48ZyBpZD0iU1ZHUmVwb190cmFjZXJDYXJyaWVyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiPjwvZz48ZyBpZD0iU1ZHUmVwb19pY29uQ2FycmllciI+IDx0aXRsZT50ZXJtaW5hbDwvdGl0bGU+IDxkZXNjPkNyZWF0ZWQgd2l0aCBza2V0Y2h0b29sLjwvZGVzYz4gPGcgaWQ9InByb2R1Y3Rpb24iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPiA8ZyBpZD0idGVybWluYWwiIGZpbGw9IiMwMDAwMDAiIGZpbGwtcnVsZT0ibm9uemVybyI+IDxwYXRoIGQ9Ik00LDQgTDIwLDQgQzIxLjEwNDU2OTUsNCAyMiw0Ljg5NTQzMDUgMjIsNiBMMjIsMTggQzIyLDE5LjEwNDU2OTUgMjEuMTA0NTY5NSwyMCAyMCwyMCBMNCwyMCBDMi44OTU0MzA1LDIwIDIsMTkuMTA0NTY5NSAyLDE4IEwyLDYgQzIsNC44OTU0MzA1IDIuODk1NDMwNSw0IDQsNCBaIE00LDYgTDQsMTggTDIwLDE4IEwyMCw2IEw0LDYgWiBNMTIsMTQgTDE4LDE0IEwxOCwxNiBMMTIsMTYgTDEyLDE0IFogTTEwLjk4NTI4MTQsMTEuNTcxMDY3OCBMNy40NDk3NDc0NywxNS4xMDY2MDE3IEw2LjAzNTUzMzkxLDEzLjY5MjM4ODIgTDguMTU2ODU0MjUsMTEuNTcxMDY3OCBMNi4wMzU1MzM5MSw5LjQ0OTc0NzQ3IEw3LjQ0OTc0NzQ3LDguMDM1NTMzOTEgTDEwLjk4NTI4MTQsMTEuNTcxMDY3OCBaIiBpZD0iU2hhcGUiPiA8L3BhdGg+IDwvZz4gPC9nPiA8L2c+PC9zdmc+Cg==)
![oksh](https://img.shields.io/badge/oksh-cec7d1.svg?logo=data:image/svg%2bxml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgZmlsbD0iIzAwMDAwMCI+PGcgaWQ9IlNWR1JlcG9fYmdDYXJyaWVyIiBzdHJva2Utd2lkdGg9IjAiPjwvZz48ZyBpZD0iU1ZHUmVwb190cmFjZXJDYXJyaWVyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiPjwvZz48ZyBpZD0iU1ZHUmVwb19pY29uQ2FycmllciI+IDx0aXRsZT50ZXJtaW5hbDwvdGl0bGU+IDxkZXNjPkNyZWF0ZWQgd2l0aCBza2V0Y2h0b29sLjwvZGVzYz4gPGcgaWQ9InByb2R1Y3Rpb24iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPiA8ZyBpZD0idGVybWluYWwiIGZpbGw9IiMwMDAwMDAiIGZpbGwtcnVsZT0ibm9uemVybyI+IDxwYXRoIGQ9Ik00LDQgTDIwLDQgQzIxLjEwNDU2OTUsNCAyMiw0Ljg5NTQzMDUgMjIsNiBMMjIsMTggQzIyLDE5LjEwNDU2OTUgMjEuMTA0NTY5NSwyMCAyMCwyMCBMNCwyMCBDMi44OTU0MzA1LDIwIDIsMTkuMTA0NTY5NSAyLDE4IEwyLDYgQzIsNC44OTU0MzA1IDIuODk1NDMwNSw0IDQsNCBaIE00LDYgTDQsMTggTDIwLDE4IEwyMCw2IEw0LDYgWiBNMTIsMTQgTDE4LDE0IEwxOCwxNiBMMTIsMTYgTDEyLDE0IFogTTEwLjk4NTI4MTQsMTEuNTcxMDY3OCBMNy40NDk3NDc0NywxNS4xMDY2MDE3IEw2LjAzNTUzMzkxLDEzLjY5MjM4ODIgTDguMTU2ODU0MjUsMTEuNTcxMDY3OCBMNi4wMzU1MzM5MSw5LjQ0OTc0NzQ3IEw3LjQ0OTc0NzQ3LDguMDM1NTMzOTEgTDEwLjk4NTI4MTQsMTEuNTcxMDY3OCBaIiBpZD0iU2hhcGUiPiA8L3BhdGg+IDwvZz4gPC9nPiA8L2c+PC9zdmc+Cg==)
![posh](https://img.shields.io/badge/posh-cec7d1.svg?logo=data:image/svg%2bxml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgZmlsbD0iIzAwMDAwMCI+PGcgaWQ9IlNWR1JlcG9fYmdDYXJyaWVyIiBzdHJva2Utd2lkdGg9IjAiPjwvZz48ZyBpZD0iU1ZHUmVwb190cmFjZXJDYXJyaWVyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiPjwvZz48ZyBpZD0iU1ZHUmVwb19pY29uQ2FycmllciI+IDx0aXRsZT50ZXJtaW5hbDwvdGl0bGU+IDxkZXNjPkNyZWF0ZWQgd2l0aCBza2V0Y2h0b29sLjwvZGVzYz4gPGcgaWQ9InByb2R1Y3Rpb24iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPiA8ZyBpZD0idGVybWluYWwiIGZpbGw9IiMwMDAwMDAiIGZpbGwtcnVsZT0ibm9uemVybyI+IDxwYXRoIGQ9Ik00LDQgTDIwLDQgQzIxLjEwNDU2OTUsNCAyMiw0Ljg5NTQzMDUgMjIsNiBMMjIsMTggQzIyLDE5LjEwNDU2OTUgMjEuMTA0NTY5NSwyMCAyMCwyMCBMNCwyMCBDMi44OTU0MzA1LDIwIDIsMTkuMTA0NTY5NSAyLDE4IEwyLDYgQzIsNC44OTU0MzA1IDIuODk1NDMwNSw0IDQsNCBaIE00LDYgTDQsMTggTDIwLDE4IEwyMCw2IEw0LDYgWiBNMTIsMTQgTDE4LDE0IEwxOCwxNiBMMTIsMTYgTDEyLDE0IFogTTEwLjk4NTI4MTQsMTEuNTcxMDY3OCBMNy40NDk3NDc0NywxNS4xMDY2MDE3IEw2LjAzNTUzMzkxLDEzLjY5MjM4ODIgTDguMTU2ODU0MjUsMTEuNTcxMDY3OCBMNi4wMzU1MzM5MSw5LjQ0OTc0NzQ3IEw3LjQ0OTc0NzQ3LDguMDM1NTMzOTEgTDEwLjk4NTI4MTQsMTEuNTcxMDY3OCBaIiBpZD0iU2hhcGUiPiA8L3BhdGg+IDwvZz4gPC9nPiA8L2c+PC9zdmc+Cg==)
![yash](https://img.shields.io/badge/yash-cec7d1.svg?logo=data:image/svg%2bxml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgZmlsbD0iIzAwMDAwMCI+PGcgaWQ9IlNWR1JlcG9fYmdDYXJyaWVyIiBzdHJva2Utd2lkdGg9IjAiPjwvZz48ZyBpZD0iU1ZHUmVwb190cmFjZXJDYXJyaWVyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiPjwvZz48ZyBpZD0iU1ZHUmVwb19pY29uQ2FycmllciI+IDx0aXRsZT50ZXJtaW5hbDwvdGl0bGU+IDxkZXNjPkNyZWF0ZWQgd2l0aCBza2V0Y2h0b29sLjwvZGVzYz4gPGcgaWQ9InByb2R1Y3Rpb24iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPiA8ZyBpZD0idGVybWluYWwiIGZpbGw9IiMwMDAwMDAiIGZpbGwtcnVsZT0ibm9uemVybyI+IDxwYXRoIGQ9Ik00LDQgTDIwLDQgQzIxLjEwNDU2OTUsNCAyMiw0Ljg5NTQzMDUgMjIsNiBMMjIsMTggQzIyLDE5LjEwNDU2OTUgMjEuMTA0NTY5NSwyMCAyMCwyMCBMNCwyMCBDMi44OTU0MzA1LDIwIDIsMTkuMTA0NTY5NSAyLDE4IEwyLDYgQzIsNC44OTU0MzA1IDIuODk1NDMwNSw0IDQsNCBaIE00LDYgTDQsMTggTDIwLDE4IEwyMCw2IEw0LDYgWiBNMTIsMTQgTDE4LDE0IEwxOCwxNiBMMTIsMTYgTDEyLDE0IFogTTEwLjk4NTI4MTQsMTEuNTcxMDY3OCBMNy40NDk3NDc0NywxNS4xMDY2MDE3IEw2LjAzNTUzMzkxLDEzLjY5MjM4ODIgTDguMTU2ODU0MjUsMTEuNTcxMDY3OCBMNi4wMzU1MzM5MSw5LjQ0OTc0NzQ3IEw3LjQ0OTc0NzQ3LDguMDM1NTMzOTEgTDEwLjk4NTI4MTQsMTEuNTcxMDY3OCBaIiBpZD0iU2hhcGUiPiA8L3BhdGg+IDwvZz4gPC9nPiA8L2c+PC9zdmc+Cg==)
![zsh](https://img.shields.io/badge/zsh-cec7d1.svg?logo=zsh&logoColor=black)

A **S**imple POS**IX**-compliant **Logger** function for shell scripts.

[![asciicast](https://asciinema.org/a/765449.svg)](https://asciinema.org/a/765449)

## Requirements

Has only a few requirements:

- `basename`
- `date`
- `tr`

## Globals

`SIXLOGGER_DEBUG` and `SIXLOGGER_NO_COLOR` take precedence over `DEBUG` and `NO_COLOR`.

| Name | Description | Type | Default |
| ---- | ----------- | ---- | ------- |
| `SIXLOGGER_DEBUG` or `DEBUG` | If set to `true` or `1`, show `debug` messages | `boolean` | `false` |
| `SIXLOGGER_NO_COLOR` or `NO_COLOR` | If set to `true` or `1`, disable colored terminal output | `boolean` | `false` |
| `SIXLOGGER_COLOR_DEBUG` | Set output color for `debug` messages | `ANSI escape sequence` | `\033[0;34m` |
| `SIXLOGGER_COLOR_INFO` | Set output color for `info` messages | `ANSI escape sequence` | `\033[0;32m` |
| `SIXLOGGER_COLOR_WARN` | Set output color for `warn` messages | `ANSI escape sequence` | `\033[1;33m` |
| `SIXLOGGER_COLOR_ERROR` | Set output color for `error` messages | `ANSI escape sequence` | `\033[0;31m` |
| `SIXLOGGER_COLOR_FATAL` | Set output color for `fatal` messages | `ANSI escape sequence` | `\033[1;31m` |
| `E_SIXLOGGER_UNKNOWN_LOGLEVEL` | Set status code for unknown loglevel error | `number` | `30` |

## Arguments

The `sixlogger` function takes two arguments:

| Sh | Name | Description | Type |
| -- | ---- | ----------- | ---- |
| `$1` | loglevel | Loglevel for logger (e.g.: `info`) | `string` |
| `$*` | message | Message to log (e.g.: `"My log message"`) | `string` |

## Outputs

| Output | Description |
| ------ | ----------- |
| `stdout` | Writes `info`, `warn` and `debug` log messages to `stdout`. |
| `stderr` | Writes `error` and `fatal` log messages to `stderr`. |

## Returns

| Status Code | Description |
| ----------- | ----------- |
| `0` | No errors. |
| `30` | `E_SIXLOGGER_UNKNOWN_LOGLEVEL` |

## Usage

### Download script

```sh
# Download the sixlogger function into a new script
SIXLOGGER_VERSION=0.1.1
cat <<EOF > sixlogger.sh && chmod +x sixlogger.sh
#!/bin/sh
$(curl -sSfL "https://github.com/esaporski/sixlogger/releases/download/${SIXLOGGER_VERSION}/sixlogger.sh")
EOF
```

### Embedding into a file

```shell
# Add the sixlogger function after shebang `#!`
SIXLOGGER_VERSION=0.1.1
curl -sSfL "https://github.com/esaporski/sixlogger/releases/download/${SIXLOGGER_VERSION}/sixlogger.sh" |
  sed -i '/#!/r /dev/stdin' my_script.sh
```

### Source it from another file

After downloading the script with the command above, add these lines in your script:

```sh
#!/bin/sh

# Get script directory absolute path
script_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)"

. "${script_dir}/sixlogger.sh"
```

## Examples

- [Simple](examples/simple.sh)
- [Advanced](examples/advanced.sh)
- [Capture command output](examples/fail_capture_command_output.sh)

### `SIXLOGGER_DEBUG` and `SIXLOGGER_NO_COLOR`

```sh
DEBUG=true
sixlogger debug "A debug message"
# Outputs:
# > \e[0;34m2025-01-01T00:00:00+00:00 | debug | example.sh | A debug message\e[0m

# `SIXLOGGER_DEBUG` takes precedence over `DEBUG`
# so you will not see this message
SIXLOGGER_DEBUG=false
sixlogger debug "You will not see me!"
# Outputs:
# >

# ...but this works
DEBUG=false
SIXLOGGER_DEBUG=true
sixlogger debug "Now you can see me again"
# Outputs:
# > \e[0;34m2025-01-01T00:00:00+00:00 | debug | example.sh | Now you can see me again\e[0m

# It's the same thing for `SIXLOGGER_NO_COLOR` and `NO_COLOR`
NO_COLOR=false
sixlogger info "Colored terminal output is enabled by default"
# Outputs:
# > \e[0;32m2025-01-01T00:00:00+00:00 | info | example.sh | Colored terminal output is enabled by default\e[0m

# Disables colored output even with `NO_COLOR` still set to `false`
SIXLOGGER_NO_COLOR=true
sixlogger info "Colored terminal output is disabled now"
# Outputs:
# > 2025-01-01T00:00:00+00:00 | info | example.sh | Colored terminal output is disabled now
```

### Capturing output and status code from commands

```sh
filename="my_file"
sixlogger info "Removing file '${filename}'"

# Initialize the `status_code` variable with `0`
status_code=0

# Let's redirect `stderr` to `stdout` and save the output of the command we want to run
# If the command fails, we save the exit status code into `status_code`
output=$(rm "$filename" 2>&1) || status_code=$?

# Now we check if the exit status code is still `0` (success)
# If not, we print a message and exit passing the failed command's status code
[ "$status_code" -eq 0 ] || {
 sixlogger fatal "Failed to remove '${filename}' with status code '${status_code}': ${output}"
 exit "$status_code"
}
sixlogger info "Deleted '${filename}'"

# On success:
# > 2025-01-01T00:00:00+00:00 | info | example.sh | Removing file 'my_file'
# > 2025-01-01T00:00:00+00:00 | info | example.sh | Deleted 'my_file'

# On failure:
# > 2025-01-01T00:00:00+00:00 | info | example.sh | Removing file 'my_file'
# > 2025-01-01T00:00:00+00:00 | fatal | example.sh | Failed to remove 'my_file' with status code '1': rm: cannot remove 'my_file': No such file or directory
# > echo $?
# > 1
```

### Logging into a file

When logging into a file, you need to remember that:

- `error` and `fatal` messages are sent to `stderr`.
- You need to disable colored output with `SIXLOGGER_NO_COLOR` or `NO_COLOR`.

```sh
SIXLOGGER_NO_COLOR=true # or NO_COLOR=true
export SIXLOGGER_NO_COLOR

# You can log `stdout` and `stderr` into different files
./my_script.sh 1>/var/log/my_script.log 2>/var/log/my_script.err.log

# Or you can log everything into a single file
./my_script.sh >/var/log/my_script.log 2>&1
```

If you want to disable colored output when `stdout` or `stderr` are being redirected to another file or command, you can include this snippet in your own script:

```shell
# Disable color if redirecting `stdout` or `stderr` to another command or file
if ! { [ -t 1 ] && [ -t 2 ]; }; then SIXLOGGER_NO_COLOR=true; fi && export SIXLOGGER_NO_COLOR

# Or...
if ! { [ -t 1 ] && [ -t 2 ]; }; then NO_COLOR=true; fi && export NO_COLOR
```

## Changelog

[CHANGELOG.md](CHANGELOG.md)

## License

[MIT License](https://github.com/esaporski/sixlogger/blob/master/LICENSE)

@REM Copyright (C) 2012 Anaconda, Inc
@REM SPDX-License-Identifier: BSD-3-Clause

@REM echo _CE_CONDA is %_CE_CONDA%
@REM echo _CE_I is %_CE_I%
@REM echo _CE_M is %_CE_M%
@REM echo CONDA_EXE is %CONDA_EXE%

@IF NOT DEFINED _CE_CONDA (
  @REM This is dev mode, allow PYTHON* env vars by not setting -I ## CHECK!
  @SET _CE_I=
  @SET _CE_M=-m
  @SET _CE_CONDA=conda
  @SET "CONDA_EXE=%~dp0..\Scripts\conda.exe"
  @SET "CONDA_PYTHON_EXE=%~dp0..\python.exe"
)
@IF [%1]==[activate]   "%~dp0_conda_activate" %*
@IF [%1]==[deactivate] "%~dp0_conda_activate" %*

@SET CONDA_EXES="%CONDA_PYTHON_EXE%" %_CE_I% %_CE_M% %_CE_CONDA%
@CALL %CONDA_EXES% %*

@IF %errorlevel% NEQ 0 EXIT /B %errorlevel%

@IF [%1]==[install]   "%~dp0_conda_activate" reactivate
@IF [%1]==[update]    "%~dp0_conda_activate" reactivate
@IF [%1]==[upgrade]   "%~dp0_conda_activate" reactivate
@IF [%1]==[remove]    "%~dp0_conda_activate" reactivate
@IF [%1]==[uninstall] "%~dp0_conda_activate" reactivate

@EXIT /B %errorlevel%

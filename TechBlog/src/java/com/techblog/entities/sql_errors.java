package com.techblog.entities;

public class sql_errors {

    private String ErrorMessage, ErrorCode;

    public sql_errors() {
    }

    public sql_errors(String ErrorMessage, String ErrorCode) {
        this.ErrorMessage = ErrorMessage;
        this.ErrorCode = ErrorCode;
    }

    public String getErrorMessage() {
        return ErrorMessage;
    }

    public void setErrorMessage(String ErrorMessage) {
        this.ErrorMessage = ErrorMessage;
    }

    public String getErrorCode() {
        return ErrorCode;
    }

    public void setErrorCode(String ErrorCode) {
        this.ErrorCode = ErrorCode;
    }

    /**
     * To set errorCode and error message
     * @param ErrorCode
     * @param ErrorMessage
     */
    public void setError(String ErrorCode, String ErrorMessage) {
        this.ErrorMessage = ErrorMessage;
        this.ErrorCode = ErrorCode;
    }

    public String getError() {
        return ErrorCode + " " + ErrorMessage;
    }

    @Override
    public String toString() {
        return "sql_errors{" + "ErrorMessage=" + ErrorMessage + ", ErrorCode=" + ErrorCode + '}';
    }

}

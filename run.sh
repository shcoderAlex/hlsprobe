#!/bin/bash

# PREPARE CONFIG
sed  "s|##STREAMS_URL##|${STREAMS_URL}|;s|##WORKERS_STREAM_PROBERS##|${WORKERS_STREAM_PROBERS}|;s|##WORKERS_MEDIA_PROBERS##|${WORKERS_MEDIA_PROBERS}|;s|##NOTIFY_REPORT_THRESHOLD##|${NOTIFY_REPORT_THRESHOLD}|;s|##NOTIFY_ADDRESSES##|${NOTIFY_ADDRESSES}|;s|##NOTIFY_AUTHOR##|${NOTIFY_AUTHOR}|;s|##SLEEP_PLAYLIST_OPEN##|${SLEEP_PLAYLIST_OPEN}|;s|##SLEEP_STREAM_LIST##|${SLEEP_STREAM_LIST}|;s|##TIMEOUT_TARGET_DURATION##|${TIMEOUT_TARGET_DURATION}|;s|##TIMEOUT_READ##|${TIMEOUT_READ}|;s|##TIMEOUT_KEEP_ERROR##|${TIMEOUT_KEEP_ERROR}|;s|##TIMEOUT_SPAM##|${TIMEOUT_SPAM}|;s|##MODE_ONE_SEGMENT##|${MODE_ONE_SEGMENT}|" config.tmpl > config.yaml

# EXEC
service postfix start
./hlsprobe -v -c config.yaml

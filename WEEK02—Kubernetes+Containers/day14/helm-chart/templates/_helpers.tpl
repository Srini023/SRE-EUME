{{- define "hello-api.name" -}}
hello-api
{{- end }}

{{- define "hello-api.fullname" -}}
{{ .Release.Name }}-hello-api
{{- end }}


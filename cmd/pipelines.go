/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>

*/
package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

// pipelinesCmd represents the pipelines command
var pipelinesCmd = &cobra.Command{
	Use:   "pipelines",
	Short: "List pipelines",
	Long: `List pipelines`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("pipelines called")
		fmt.Println(cmd.Flags().GetString("o"))
	},
}

func init() {
	getCmd.AddCommand(pipelinesCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// pipelinesCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// pipelinesCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
